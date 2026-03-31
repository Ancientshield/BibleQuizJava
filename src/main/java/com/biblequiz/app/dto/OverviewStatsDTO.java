package com.biblequiz.app.dto;

/** 全站總覽統計 DTO — 管理者儀表板用。 */
public class OverviewStatsDTO {

    private long totalRounds;
    private int totalPublishedQuestions;
    private double averageAccuracyRate;

    // ── Getters and Setters ──
    public long getTotalRounds() { return totalRounds; }
    public void setTotalRounds(long totalRounds) { this.totalRounds = totalRounds; }

    public int getTotalPublishedQuestions() { return totalPublishedQuestions; }
    public void setTotalPublishedQuestions(int totalPublishedQuestions) { this.totalPublishedQuestions = totalPublishedQuestions; }

    public double getAverageAccuracyRate() { return averageAccuracyRate; }
    public void setAverageAccuracyRate(double averageAccuracyRate) { this.averageAccuracyRate = averageAccuracyRate; }
}
