package com.biblequiz.app.service;

import com.biblequiz.app.dto.RoundHistoryDTO;
import com.biblequiz.app.dto.UserStatsDTO;
import com.biblequiz.app.repository.QuizRoundRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/** 使用者個人紀錄 Service — 遊戲歷史、個人統計。 */
@Service
public class UserHistoryService {

    private final QuizRoundRepository quizRoundRepository;

    public UserHistoryService(QuizRoundRepository quizRoundRepository) {
        this.quizRoundRepository = quizRoundRepository;
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

    /** 我的個人統計（總遊戲次數、平均分數、最高分） */
    public UserStatsDTO getStats(Long userId) {
        Object[] raw = quizRoundRepository.findUserStats(userId);

        UserStatsDTO dto = new UserStatsDTO();
        dto.setTotalGames(((Number) raw[0]).longValue());
        dto.setAverageScore(Math.round(((Number) raw[1]).doubleValue() * 10.0) / 10.0);
        dto.setBestScore(((Number) raw[2]).intValue());
        return dto;
    }
}
