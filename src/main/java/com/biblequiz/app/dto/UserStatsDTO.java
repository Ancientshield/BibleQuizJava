package com.biblequiz.app.dto;

/** 使用者個人統計 DTO — 總遊戲次數、平均分數、最高分。 */
public class UserStatsDTO {

    private long totalGames;
    private double averageScore;
    private int perfectGames;
    private long totalScore;

    // ── Getters and Setters ──
    public long getTotalGames() { return totalGames; }
    public void setTotalGames(long totalGames) { this.totalGames = totalGames; }

    public double getAverageScore() { return averageScore; }
    public void setAverageScore(double averageScore) { this.averageScore = averageScore; }

    public int getPerfectGames() { return perfectGames; }
    public void setPerfectGames(int perfectGames) { this.perfectGames = perfectGames; }

    public long getTotalScore() { return totalScore; }
    public void setTotalScore(long totalScore) { this.totalScore = totalScore; }
}
