package com.biblequiz.app.service;

import com.biblequiz.app.dto.AdminPublishRequest;
import com.biblequiz.app.dto.AdminQuestionUpdateRequest;
import com.biblequiz.app.dto.OptionDTO;
import com.biblequiz.app.dto.QuestionCreateRequest;
import com.biblequiz.app.dto.QuestionDetailDTO;
import com.biblequiz.app.dto.QuestionUpdateRequest;
import com.biblequiz.app.entity.AppUser;
import com.biblequiz.app.entity.BibleBook;
import com.biblequiz.app.entity.Question;
import com.biblequiz.app.entity.QuestionCategory;
import com.biblequiz.app.entity.QuestionOption;
import com.biblequiz.app.entity.QuestionStatus;
import com.biblequiz.app.repository.AppUserRepository;
import com.biblequiz.app.repository.BibleBookRepository;
import com.biblequiz.app.repository.QuestionCategoryRepository;
import com.biblequiz.app.repository.QuestionRepository;
import com.biblequiz.app.repository.QuestionSpecification;
import com.biblequiz.app.repository.QuizAnswerLogRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

/** 題目 CRUD + 審核 Service — 投稿、編輯、刪除、核准、退回。 */
@Service
public class QuestionService {

    private static final int MAX_PENDING_PER_USER = 10;

    private final QuestionRepository questionRepository;
    private final QuestionCategoryRepository questionCategoryRepository;
    private final BibleBookRepository bibleBookRepository;
    private final AppUserRepository appUserRepository;
    private final QuizAnswerLogRepository quizAnswerLogRepository;

    public QuestionService(QuestionRepository questionRepository,
                           QuestionCategoryRepository questionCategoryRepository,
                           BibleBookRepository bibleBookRepository,
                           AppUserRepository appUserRepository,
                           QuizAnswerLogRepository quizAnswerLogRepository) {
        this.questionRepository = questionRepository;
        this.questionCategoryRepository = questionCategoryRepository;
        this.bibleBookRepository = bibleBookRepository;
        this.appUserRepository = appUserRepository;
        this.quizAnswerLogRepository = quizAnswerLogRepository;
    }

    /** 新增題目 — status 直接設 PENDING，不經過 DRAFT。 */
    @Transactional
    public QuestionDetailDTO create(QuestionCreateRequest request, Long userId) {
        validateCreateRequest(request);

        // 檢查投稿上限
        int pendingCount = questionRepository.countByCreatedByAndStatus(userId, QuestionStatus.PENDING);
        if (pendingCount >= MAX_PENDING_PER_USER) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
                    "投稿上限為 " + MAX_PENDING_PER_USER + " 題，請等待審核完成後再投稿");
        }

        Question question = new Question();
        question.setContent(request.getContent().trim());
        question.setStatus(QuestionStatus.PENDING);
        question.setCreatedBy(userId);

        // 建立選項，設定雙向關聯
        List<QuestionOption> options = new ArrayList<>();
        for (QuestionCreateRequest.OptionRequest optReq : request.getOptions()) {
            QuestionOption option = new QuestionOption();
            option.setContent(optReq.getContent().trim());
            option.setIsCorrect(optReq.isCorrect());
            option.setQuestion(question);
            options.add(option);
        }
        question.setOptions(options);

        Question saved = questionRepository.save(question);
        return convertToDetailDTO(saved);
    }

    /** 查看單一題目 — 使用者只能看自己的，管理者可看全部。 */
    public QuestionDetailDTO getQuestion(Integer id, Long userId, boolean isAdmin) {
        Question question = questionRepository.findByIdWithOptions(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "題目不存在"));

        if (!isAdmin && !userId.equals(question.getCreatedBy())) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "只能查看自己的題目");
        }
        return convertToDetailDTO(question);
    }

    /** 查看我的題目 */
    public List<QuestionDetailDTO> getMyQuestions(Long userId) {
        return questionRepository.findAllWithOptionsByCreatedBy(userId).stream()
                .map(this::convertToDetailDTO)
                .collect(Collectors.toList());
    }

    /** 編輯題目 — 使用者只能改自己的 PENDING/REJECTED，管理者不限。 */
    @Transactional
    public QuestionDetailDTO update(Integer id, QuestionUpdateRequest request, Long userId, boolean isAdmin) {
        validateUpdateRequest(request);

        Question question = questionRepository.findByIdWithOptions(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "題目不存在"));

        checkEditPermission(question, userId, isAdmin);

        question.setContent(request.getContent().trim());

        // 未通過的題目編輯後，重新進入審核流程
        if (question.getStatus() == QuestionStatus.REJECTED) {
            question.setStatus(QuestionStatus.PENDING);
        }

        // 替換選項：清除舊的 → 加入新的（orphanRemoval 自動刪除舊選項）
        question.getOptions().clear();
        for (QuestionUpdateRequest.OptionRequest optReq : request.getOptions()) {
            QuestionOption option = new QuestionOption();
            option.setContent(optReq.getContent().trim());
            option.setIsCorrect(optReq.isCorrect());
            option.setQuestion(question);
            question.getOptions().add(option);
        }

        Question saved = questionRepository.save(question);
        return convertToDetailDTO(saved);
    }

    /** 刪除題目 — 使用者只能刪自己的 PENDING，管理者不限。 */
    @Transactional
    public void delete(Integer id, Long userId, boolean isAdmin) {
        Question question = questionRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "題目不存在"));

        checkEditPermission(question, userId, isAdmin);

        questionRepository.delete(question);
    }

    // ── G-3：管理者審核 ──

    /** 列出所有題目（可按 status 篩選） */
    public List<QuestionDetailDTO> getAllQuestions(QuestionStatus status) {
        List<Question> questions;
        if (status != null) {
            questions = questionRepository.findAllWithOptionsByStatus(status);
        } else {
            questions = questionRepository.findAllWithOptions();
        }
        return questions.stream()
                .map(this::convertToDetailDTO)
                .collect(Collectors.toList());
    }

    /**
     * 分頁搜尋題目 — 支援 7 個篩選條件。
     * 兩段式查詢：先用 Specification 拿分頁 ID，再用 JOIN FETCH 載入關聯。
     */
    @Transactional(readOnly = true)
    public Page<QuestionDetailDTO> searchQuestions(
            QuestionStatus status, Short categoryId,
            String keyword, String optionKeyword, String author,
            LocalDate dateFrom, LocalDate dateTo,
            boolean includeStats, Pageable pageable) {

        Specification<Question> spec = QuestionSpecification.withFilters(
                status, categoryId, keyword, optionKeyword, author, dateFrom, dateTo);

        // Step 1: 分頁查詢（不含 FETCH JOIN，避免 in-memory 分頁）
        Page<Question> page = questionRepository.findAll(spec, pageable);
        if (page.isEmpty()) {
            return Page.empty(pageable);
        }

        // Step 2: 用 ID 批次載入完整關聯
        List<Integer> ids = page.getContent().stream()
                .map(Question::getId).toList();
        List<Question> loaded = questionRepository.findAllWithOptionsByIds(ids);

        // Step 3: 批次載入作者名稱
        Set<Long> userIds = loaded.stream()
                .map(Question::getCreatedBy)
                .filter(Objects::nonNull)
                .collect(Collectors.toSet());
        Map<Long, String> authorMap = userIds.isEmpty() ? Map.of() :
                appUserRepository.findAllById(userIds).stream()
                        .collect(Collectors.toMap(AppUser::getId,
                                u -> u.getName() != null ? u.getName() : u.getEmail()));

        // Step 3.5: 批次載入統計資料（includeStats=true 時）
        Map<Integer, long[]> statsMap = Map.of();
        Map<Integer, Map<Integer, Long>> optionStatsMap = Map.of();
        if (includeStats) {
            // [questionId, totalCount, correctCount]
            statsMap = quizAnswerLogRepository.findQuestionStatsByIds(ids).stream()
                    .collect(Collectors.toMap(
                            r -> (Integer) r[0],
                            r -> new long[]{ (Long) r[1], (Long) r[2] }));

            // [questionId, selectedOptionId, count]
            optionStatsMap = new java.util.HashMap<>();
            for (Object[] r : quizAnswerLogRepository.findOptionDistributionByIds(ids)) {
                Integer qId = (Integer) r[0];
                Integer optId = (Integer) r[1];
                Long count = (Long) r[2];
                optionStatsMap.computeIfAbsent(qId, k -> new java.util.HashMap<>()).put(optId, count);
            }
        }

        // Step 4: 按原始排序組 DTO
        Map<Integer, Question> qMap = loaded.stream()
                .collect(Collectors.toMap(Question::getId, q -> q));
        final Map<Integer, long[]> finalStatsMap = statsMap;
        final Map<Integer, Map<Integer, Long>> finalOptMap = optionStatsMap;

        List<QuestionDetailDTO> content = ids.stream()
                .map(qMap::get)
                .filter(Objects::nonNull)
                .map(q -> {
                    QuestionDetailDTO dto = convertToDetailDTO(q);
                    if (q.getCreatedBy() != null) {
                        dto.setAuthorName(authorMap.getOrDefault(q.getCreatedBy(), "未知"));
                    }
                    // 填入統計
                    if (includeStats) {
                        enrichWithStats(dto, q, finalStatsMap, finalOptMap);
                    }
                    return dto;
                })
                .toList();

        return new PageImpl<>(content, pageable, page.getTotalElements());
    }

    /** 把統計數據填入 DTO — 被答次數、答對率、各選項被選次數、最常選錯。 */
    private void enrichWithStats(QuestionDetailDTO dto, Question q,
                                  Map<Integer, long[]> statsMap,
                                  Map<Integer, Map<Integer, Long>> optionStatsMap) {
        long[] counts = statsMap.getOrDefault(q.getId(), new long[]{0, 0});
        int total = (int) counts[0];
        int correct = (int) counts[1];
        dto.setTotalAnswered(total);
        dto.setCorrectCount(correct);
        dto.setAccuracyRate(total > 0 ? Math.round((double) correct / total * 1000.0) / 10.0 : null);

        // 各選項被選次數
        Map<Integer, Long> optCounts = optionStatsMap.getOrDefault(q.getId(), Map.of());
        String mostWrong = null;
        long mostWrongCount = 0;
        for (OptionDTO opt : dto.getOptions()) {
            int selected = optCounts.getOrDefault(opt.getId(), 0L).intValue();
            opt.setSelectedCount(selected);
            if (!opt.isCorrect() && selected > mostWrongCount) {
                mostWrongCount = selected;
                mostWrong = opt.getContent();
            }
        }
        dto.setMostSelectedWrongOption(mostWrong);
    }

    /** 管理者編輯題目 — 可改內容、選項、分類、經文出處，不改狀態。 */
    @Transactional
    public QuestionDetailDTO adminUpdate(Integer id, AdminQuestionUpdateRequest request) {
        if (request.getContent() == null || request.getContent().isBlank()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "題目內容不能為空");
        }
        validateAdminOptions(request.getOptions());

        Question question = questionRepository.findByIdWithOptions(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "題目不存在"));

        question.setContent(request.getContent().trim());

        // 替換選項（orphanRemoval 自動清除舊選項）
        question.getOptions().clear();
        for (AdminQuestionUpdateRequest.OptionRequest opt : request.getOptions()) {
            QuestionOption option = new QuestionOption();
            option.setContent(opt.getContent().trim());
            option.setIsCorrect(opt.isCorrect());
            option.setQuestion(question);
            question.getOptions().add(option);
        }

        // 分類（有傳就更新）
        if (request.getCategoryId() != null) {
            QuestionCategory category = questionCategoryRepository.findById(request.getCategoryId())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "分類不存在"));
            question.setCategory(category);
        }

        // 經文出處（有傳書卷就更新整組）
        if (request.getBibleBookId() != null) {
            BibleBook book = bibleBookRepository.findById(request.getBibleBookId())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "書卷不存在"));
            question.setBibleBook(book);
            question.setBibleChapter(request.getBibleChapter());
            question.setBibleVerseStart(request.getBibleVerseStart());
            question.setBibleVerseEnd(request.getBibleVerseEnd());
        }

        return convertToDetailDTO(questionRepository.save(question));
    }

    /** 管理者刪除題目 — 不限狀態，硬刪除。 */
    @Transactional
    public void adminDelete(Integer id) {
        Question question = questionRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "題目不存在"));
        questionRepository.delete(question);
    }

    /** 核准上架 — 設定 category + 經文出處 → PUBLISHED */
    @Transactional
    public QuestionDetailDTO publish(Integer id, AdminPublishRequest request) {
        Question question = questionRepository.findByIdWithOptions(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "題目不存在"));

        // 驗證必填欄位
        if (request.getCategoryId() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "必須指定分類");
        }
        if (request.getBibleBookId() == null || request.getBibleChapter() == null
                || request.getBibleVerseStart() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "必須指定經文出處（書卷 + 章 + 起始節）");
        }

        // 查找 category 和 bibleBook
        QuestionCategory category = questionCategoryRepository.findById(request.getCategoryId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "分類不存在"));
        BibleBook bibleBook = bibleBookRepository.findById(request.getBibleBookId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "書卷不存在"));

        question.setCategory(category);
        question.setBibleBook(bibleBook);
        question.setBibleChapter(request.getBibleChapter());
        question.setBibleVerseStart(request.getBibleVerseStart());
        question.setBibleVerseEnd(request.getBibleVerseEnd());
        question.setStatus(QuestionStatus.PUBLISHED);

        Question saved = questionRepository.save(question);
        return convertToDetailDTO(saved);
    }

    /** 退回題目 → REJECTED */
    @Transactional
    public QuestionDetailDTO reject(Integer id) {
        Question question = questionRepository.findByIdWithOptions(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "題目不存在"));

        question.setStatus(QuestionStatus.REJECTED);

        Question saved = questionRepository.save(question);
        return convertToDetailDTO(saved);
    }

    // ── 權限檢查 ──

    private void checkEditPermission(Question question, Long userId, boolean isAdmin) {
        if (isAdmin) return;

        if (!userId.equals(question.getCreatedBy())) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "只能操作自己的題目");
        }
        if (question.getStatus() != QuestionStatus.PENDING && question.getStatus() != QuestionStatus.REJECTED) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "只能操作待審核或未通過的題目");
        }
    }

    // ── 驗證 ──

    private void validateCreateRequest(QuestionCreateRequest request) {
        if (request.getContent() == null || request.getContent().isBlank()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "題目內容不能為空");
        }
        validateOptions(request.getOptions());
    }

    private void validateUpdateRequest(QuestionUpdateRequest request) {
        if (request.getContent() == null || request.getContent().isBlank()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "題目內容不能為空");
        }
        validateOptions(request.getOptions());
    }

    private void validateOptions(List<?> options) {
        if (options == null || options.size() < 2) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "至少需要 2 個選項");
        }

        long correctCount;
        if (options.get(0) instanceof QuestionCreateRequest.OptionRequest) {
            @SuppressWarnings("unchecked")
            List<QuestionCreateRequest.OptionRequest> opts = (List<QuestionCreateRequest.OptionRequest>) options;
            correctCount = opts.stream().filter(QuestionCreateRequest.OptionRequest::isCorrect).count();
        } else {
            @SuppressWarnings("unchecked")
            List<QuestionUpdateRequest.OptionRequest> opts = (List<QuestionUpdateRequest.OptionRequest>) options;
            correctCount = opts.stream().filter(QuestionUpdateRequest.OptionRequest::isCorrect).count();
        }

        if (correctCount != 1) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "必須剛好有 1 個正確答案");
        }
    }

    private void validateAdminOptions(List<AdminQuestionUpdateRequest.OptionRequest> options) {
        if (options == null || options.size() < 2) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "至少需要 2 個選項");
        }
        long correctCount = options.stream()
                .filter(AdminQuestionUpdateRequest.OptionRequest::isCorrect).count();
        if (correctCount != 1) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "必須剛好有 1 個正確答案");
        }
    }

    // ── Entity → DTO ──

    private QuestionDetailDTO convertToDetailDTO(Question question) {
        QuestionDetailDTO dto = new QuestionDetailDTO();
        dto.setId(question.getId());
        dto.setContent(question.getContent());
        dto.setStatus(question.getStatus().name());

        QuestionCategory category = question.getCategory();
        dto.setCategoryId(category != null ? category.getId() : null);
        dto.setCategoryName(category != null ? category.getName() : null);

        BibleBook book = question.getBibleBook();
        dto.setBibleBookId(book != null ? book.getId() : null);
        dto.setBibleRef(buildBibleRef(question));
        dto.setBibleChapter(question.getBibleChapter());
        dto.setBibleVerseStart(question.getBibleVerseStart());
        dto.setBibleVerseEnd(question.getBibleVerseEnd());

        List<OptionDTO> optionDTOs = question.getOptions().stream()
                .map(this::convertOptionToDTO)
                .collect(Collectors.toList());
        dto.setOptions(optionDTOs);

        dto.setCreatedBy(question.getCreatedBy());
        dto.setCreatedAt(question.getCreatedAt());
        dto.setUpdatedAt(question.getUpdatedAt());

        return dto;
    }

    private String buildBibleRef(Question question) {
        BibleBook book = question.getBibleBook();
        if (book == null) return null;

        StringBuilder sb = new StringBuilder(book.getName());
        if (question.getBibleChapter() != null) {
            sb.append(' ').append(question.getBibleChapter());
            if (question.getBibleVerseStart() != null) {
                sb.append(':').append(question.getBibleVerseStart());
                if (question.getBibleVerseEnd() != null) {
                    sb.append('-').append(question.getBibleVerseEnd());
                }
            }
        }
        return sb.toString();
    }

    private OptionDTO convertOptionToDTO(QuestionOption option) {
        OptionDTO dto = new OptionDTO();
        dto.setId(option.getId());
        dto.setContent(option.getContent());
        dto.setCorrect(option.getIsCorrect());
        return dto;
    }
}
