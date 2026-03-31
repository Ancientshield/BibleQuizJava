package com.biblequiz.app.service;

import com.biblequiz.app.dto.AdminPublishRequest;
import com.biblequiz.app.dto.OptionDTO;
import com.biblequiz.app.dto.QuestionCreateRequest;
import com.biblequiz.app.dto.QuestionDetailDTO;
import com.biblequiz.app.dto.QuestionUpdateRequest;
import com.biblequiz.app.entity.BibleBook;
import com.biblequiz.app.entity.Question;
import com.biblequiz.app.entity.QuestionCategory;
import com.biblequiz.app.entity.QuestionOption;
import com.biblequiz.app.entity.QuestionStatus;
import com.biblequiz.app.repository.BibleBookRepository;
import com.biblequiz.app.repository.QuestionCategoryRepository;
import com.biblequiz.app.repository.QuestionRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/** 題目 CRUD + 審核 Service — 投稿、編輯、刪除、核准、退回。 */
@Service
public class QuestionService {

    private static final int MAX_PENDING_PER_USER = 10;

    private final QuestionRepository questionRepository;
    private final QuestionCategoryRepository questionCategoryRepository;
    private final BibleBookRepository bibleBookRepository;

    public QuestionService(QuestionRepository questionRepository,
                           QuestionCategoryRepository questionCategoryRepository,
                           BibleBookRepository bibleBookRepository) {
        this.questionRepository = questionRepository;
        this.questionCategoryRepository = questionCategoryRepository;
        this.bibleBookRepository = bibleBookRepository;
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

    /** 編輯題目 — 使用者只能改自己的 PENDING，管理者不限。 */
    @Transactional
    public QuestionDetailDTO update(Integer id, QuestionUpdateRequest request, Long userId, boolean isAdmin) {
        validateUpdateRequest(request);

        Question question = questionRepository.findByIdWithOptions(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "題目不存在"));

        checkEditPermission(question, userId, isAdmin);

        question.setContent(request.getContent().trim());

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
        if (question.getStatus() != QuestionStatus.PENDING) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "只能操作待審核的題目");
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

    // ── Entity → DTO ──

    private QuestionDetailDTO convertToDetailDTO(Question question) {
        QuestionDetailDTO dto = new QuestionDetailDTO();
        dto.setId(question.getId());
        dto.setContent(question.getContent());
        dto.setStatus(question.getStatus().name());

        QuestionCategory category = question.getCategory();
        dto.setCategoryName(category != null ? category.getName() : null);

        dto.setBibleRef(buildBibleRef(question));

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
