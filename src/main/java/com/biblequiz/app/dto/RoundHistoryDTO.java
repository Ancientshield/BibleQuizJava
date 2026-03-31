package com.biblequiz.app.dto;

import java.time.LocalDateTime;

/** 單局遊戲紀錄 DTO — 使用者查看自己的遊戲歷史。 */
public class RoundHistoryDTO {

    private Long roundId;
    private int score;
    private int totalQuestions;
    private LocalDateTime completedAt;

    // ── Getters and Setters ──
    public Long getRoundId() { return roundId; }
    public void setRoundId(Long roundId) { this.roundId = roundId; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }

    public int getTotalQuestions() { return totalQuestions; }
    public void setTotalQuestions(int totalQuestions) { this.totalQuestions = totalQuestions; }

    public LocalDateTime getCompletedAt() { return completedAt; }
    public void setCompletedAt(LocalDateTime completedAt) { this.completedAt = completedAt; }
}
