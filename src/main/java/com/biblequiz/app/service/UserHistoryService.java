package com.biblequiz.app.service;

import com.biblequiz.app.dto.OptionDTO;
import com.biblequiz.app.dto.RoundDetailDTO;
import com.biblequiz.app.dto.RoundHistoryDTO;
import com.biblequiz.app.dto.UserStatsDTO;
import com.biblequiz.app.entity.BibleBook;
import com.biblequiz.app.entity.Question;
import com.biblequiz.app.entity.QuizAnswerLog;
import com.biblequiz.app.entity.QuizRound;
import com.biblequiz.app.repository.QuestionRepository;
import com.biblequiz.app.repository.QuizRoundRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/** 使用者個人紀錄 Service — 遊戲歷史、個人統計、答錯回顧。 */
@Service
public class UserHistoryService {

    private final QuizRoundRepository quizRoundRepository;
    private final QuestionRepository questionRepository;

    public UserHistoryService(QuizRoundRepository quizRoundRepository,
                              QuestionRepository questionRepository) {
        this.quizRoundRepository = quizRoundRepository;
        this.questionRepository = questionRepository;
    }

    /** 我的遊戲歷史（每局分數 + 日期，新到舊） */
    public List<RoundHistoryDTO> getHistory(Long userId) {
        return quizRoundRepository.findByUserIdOrderByCompletedAtDesc(userId)
                .stream()
                .map(round -> {
                    RoundHistoryDTO dto = new RoundHistoryDTO();
                    dto.setRoundId(round.getId());
                    dto.setScore(round.getScore());
                    dto.setTotalQuestions(round.getTotalQuestions());
                    dto.setCompletedAt(round.getCompletedAt());
                    return dto;
                })
                .collect(Collectors.toList());
    }

    /** 單局詳細回顧 — 10 題逐題結果 */
    @Transactional(readOnly = true)
    public RoundDetailDTO getRoundDetail(Long roundId, Long userId) {
        QuizRound round = quizRoundRepository.findById(roundId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "找不到該局紀錄"));

        if (!round.getUserId().equals(userId)) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "只能查看自己的紀錄");
        }

        List<QuizAnswerLog> logs = round.getAnswerLogs();

        // 批次載入題目 + 選項
        List<Integer> qIds = logs.stream().map(QuizAnswerLog::getQuestionId).toList();
        Map<Integer, Question> qMap = questionRepository.findAllWithOptionsByIds(qIds).stream()
                .collect(Collectors.toMap(Question::getId, q -> q));

        List<RoundDetailDTO.AnswerDetailDTO> answers = logs.stream().map(log -> {
            RoundDetailDTO.AnswerDetailDTO a = new RoundDetailDTO.AnswerDetailDTO();
            a.setQuestionId(log.getQuestionId());
            a.setSelectedOptionId(log.getSelectedOptionId());
            a.setCorrect(log.getIsCorrect());

            Question q = qMap.get(log.getQuestionId());
            if (q != null) {
                a.setQuestionContent(q.getContent());
                a.setBibleRef(buildBibleRef(q));
                a.setOptions(q.getOptions().stream().map(o -> {
                    OptionDTO opt = new OptionDTO();
                    opt.setId(o.getId());
                    opt.setContent(o.getContent());
                    opt.setCorrect(o.getIsCorrect());
                    return opt;
                }).toList());
            }
            return a;
        }).toList();

        RoundDetailDTO dto = new RoundDetailDTO();
        dto.setRoundId(round.getId());
        dto.setScore(round.getScore());
        dto.setTotalQuestions(round.getTotalQuestions());
        dto.setCompletedAt(round.getCompletedAt());
        dto.setAnswers(answers);
        return dto;
    }

    private String buildBibleRef(Question q) {
        BibleBook book = q.getBibleBook();
        if (book == null) return null;
        StringBuilder sb = new StringBuilder(book.getName());
        if (q.getBibleChapter() != null) {
            sb.append(' ').append(q.getBibleChapter());
            if (q.getBibleVerseStart() != null) {
                sb.append(':').append(q.getBibleVerseStart());
                if (q.getBibleVerseEnd() != null) sb.append('-').append(q.getBibleVerseEnd());
            }
        }
        return sb.toString();
    }

    /** 我的個人統計（總遊戲次數、平均分數、最高分） */
    public UserStatsDTO getStats(Long userId) {
        Object result = quizRoundRepository.findUserStats(userId);
        Object[] raw = (result instanceof Object[]) ? (Object[]) result : new Object[]{0L, 0.0, 0};

        UserStatsDTO dto = new UserStatsDTO();
        dto.setTotalGames(((Number) raw[0]).longValue());
        dto.setAverageScore(Math.round(((Number) raw[1]).doubleValue() * 10.0) / 10.0);
        dto.setBestScore(((Number) raw[2]).intValue());
        return dto;
    }
}
