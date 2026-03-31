package com.biblequiz.app.service;

import com.biblequiz.app.dto.OverviewStatsDTO;
import com.biblequiz.app.dto.QuestionStatsDTO;
import com.biblequiz.app.entity.Question;
import com.biblequiz.app.entity.QuestionOption;
import com.biblequiz.app.entity.QuestionStatus;
import com.biblequiz.app.repository.QuestionRepository;
import com.biblequiz.app.repository.QuizAnswerLogRepository;
import com.biblequiz.app.repository.QuizRoundRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/** 管理者統計 Service — 全站總覽、題目答對率、選項分佈。 */
@Service
public class QuestionStatsService {

    private final QuestionRepository questionRepository;
    private final QuizAnswerLogRepository quizAnswerLogRepository;
    private final QuizRoundRepository quizRoundRepository;

    public QuestionStatsService(QuestionRepository questionRepository,
                                QuizAnswerLogRepository quizAnswerLogRepository,
                                QuizRoundRepository quizRoundRepository) {
        this.questionRepository = questionRepository;
        this.quizAnswerLogRepository = quizAnswerLogRepository;
        this.quizRoundRepository = quizRoundRepository;
    }

    /** 全站總覽：總遊戲次數、上架題目數、全站答對率 */
    public OverviewStatsDTO getOverview() {
        long totalRounds = quizRoundRepository.count();
        int totalPublished = questionRepository.countByStatus(QuestionStatus.PUBLISHED);

        Object[] accuracy = quizAnswerLogRepository.findOverallAccuracy();
        long totalAnswers = (Long) accuracy[0];
        long correctAnswers = accuracy[1] != null ? ((Number) accuracy[1]).longValue() : 0;
        double avgAccuracy = totalAnswers > 0 ? (double) correctAnswers / totalAnswers * 100 : 0;

        OverviewStatsDTO dto = new OverviewStatsDTO();
        dto.setTotalRounds(totalRounds);
        dto.setTotalPublishedQuestions(totalPublished);
        dto.setAverageAccuracyRate(Math.round(avgAccuracy * 10.0) / 10.0);
        return dto;
    }

    /** 全部題目統計（列表，不含選項分佈） */
    public List<QuestionStatsDTO> getAllQuestionStats() {
        List<Object[]> rawStats = quizAnswerLogRepository.findQuestionStats();

        // 把有被答過的 questionId 都撈出來，一次查 Question 拿 content
        List<Integer> questionIds = rawStats.stream()
                .map(row -> (Integer) row[0])
                .collect(Collectors.toList());

        Map<Integer, Question> questionMap = questionRepository.findAllById(questionIds)
                .stream()
                .collect(Collectors.toMap(Question::getId, q -> q));

        return rawStats.stream().map(row -> {
            Integer questionId = (Integer) row[0];
            long total = (Long) row[1];
            long correct = row[2] != null ? ((Number) row[2]).longValue() : 0;

            QuestionStatsDTO dto = new QuestionStatsDTO();
            dto.setQuestionId(questionId);
            Question q = questionMap.get(questionId);
            dto.setContent(q != null ? q.getContent() : null);
            dto.setTotalAnswered((int) total);
            dto.setCorrectCount((int) correct);
            dto.setAccuracyRate(total > 0 ? Math.round((double) correct / total * 1000.0) / 10.0 : 0);
            return dto;
        }).collect(Collectors.toList());
    }

    /** 單題詳細統計（含選項分佈 + 最常被選的錯誤選項） */
    public QuestionStatsDTO getQuestionStats(Integer questionId) {
        Question question = questionRepository.findByIdWithOptions(questionId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "題目不存在"));

        // 查選項分佈：{optionId → 被選次數}
        List<Object[]> distribution = quizAnswerLogRepository
                .findOptionDistributionByQuestionId(questionId);
        Map<Integer, Long> optionCountMap = distribution.stream()
                .collect(Collectors.toMap(
                        row -> (Integer) row[0],
                        row -> (Long) row[1]));

        int totalAnswered = 0;
        int correctCount = 0;
        String mostSelectedWrong = null;
        int maxWrongCount = 0;
        List<QuestionStatsDTO.OptionStats> optionStatsList = new ArrayList<>();

        for (QuestionOption option : question.getOptions()) {
            long count = optionCountMap.getOrDefault(option.getId(), 0L);
            totalAnswered += (int) count;

            boolean isCorrect = Boolean.TRUE.equals(option.getIsCorrect());
            if (isCorrect) {
                correctCount += (int) count;
            } else if (count > maxWrongCount) {
                maxWrongCount = (int) count;
                mostSelectedWrong = option.getContent();
            }

            QuestionStatsDTO.OptionStats os = new QuestionStatsDTO.OptionStats();
            os.setOptionId(option.getId());
            os.setContent(option.getContent());
            os.setCorrect(isCorrect);
            os.setSelectedCount((int) count);
            optionStatsList.add(os);
        }

        QuestionStatsDTO dto = new QuestionStatsDTO();
        dto.setQuestionId(questionId);
        dto.setContent(question.getContent());
        dto.setTotalAnswered(totalAnswered);
        dto.setCorrectCount(correctCount);
        dto.setAccuracyRate(totalAnswered > 0
                ? Math.round((double) correctCount / totalAnswered * 1000.0) / 10.0 : 0);
        dto.setOptionDistribution(optionStatsList);
        dto.setMostSelectedWrongOption(mostSelectedWrong);
        return dto;
    }
}
