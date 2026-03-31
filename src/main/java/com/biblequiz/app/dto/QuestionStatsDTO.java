package com.biblequiz.app.dto;

import java.util.List;

/** 題目統計 DTO — 管理者查看每題的答對率、選項分佈。 */
public class QuestionStatsDTO {

    private Integer questionId;
    private String content;
    private int totalAnswered;
    private int correctCount;
    private double accuracyRate;
    private List<OptionStats> optionDistribution;
    private String mostSelectedWrongOption;

    /** 單一選項的被選統計。 */
    public static class OptionStats {
        private Integer optionId;
        private String content;
        private boolean correct;
        private int selectedCount;

        // ── Getters and Setters ──
        public Integer getOptionId() { return optionId; }
        public void setOptionId(Integer optionId) { this.optionId = optionId; }

        public String getContent() { return content; }
        public void setContent(String content) { this.content = content; }

        public boolean isCorrect() { return correct; }
        public void setCorrect(boolean correct) { this.correct = correct; }

        public int getSelectedCount() { return selectedCount; }
        public void setSelectedCount(int selectedCount) { this.selectedCount = selectedCount; }
    }

    // ── Getters and Setters ──
    public Integer getQuestionId() { return questionId; }
    public void setQuestionId(Integer questionId) { this.questionId = questionId; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public int getTotalAnswered() { return totalAnswered; }
    public void setTotalAnswered(int totalAnswered) { this.totalAnswered = totalAnswered; }

    public int getCorrectCount() { return correctCount; }
    public void setCorrectCount(int correctCount) { this.correctCount = correctCount; }

    public double getAccuracyRate() { return accuracyRate; }
    public void setAccuracyRate(double accuracyRate) { this.accuracyRate = accuracyRate; }

    public List<OptionStats> getOptionDistribution() { return optionDistribution; }
    public void setOptionDistribution(List<OptionStats> optionDistribution) { this.optionDistribution = optionDistribution; }

    public String getMostSelectedWrongOption() { return mostSelectedWrongOption; }
    public void setMostSelectedWrongOption(String mostSelectedWrongOption) { this.mostSelectedWrongOption = mostSelectedWrongOption; }
}
