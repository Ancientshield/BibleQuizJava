package com.biblequiz.app.dto;

import java.time.LocalDateTime;
import java.util.List;

/** 單局詳細回顧 DTO — 10 題逐題結果（答錯回顧用）。 */
public class RoundDetailDTO {

    private Long roundId;
    private int score;
    private int totalQuestions;
    private LocalDateTime completedAt;
    private List<AnswerDetailDTO> answers;

    // ── 內部 DTO：逐題結果 ──
    public static class AnswerDetailDTO {
        private Integer questionId;
        private String questionContent;
        private String bibleRef;
        private List<OptionDTO> options;
        private Integer selectedOptionId;
        private boolean correct;

        public Integer getQuestionId() { return questionId; }
        public void setQuestionId(Integer questionId) { this.questionId = questionId; }

        public String getQuestionContent() { return questionContent; }
        public void setQuestionContent(String questionContent) { this.questionContent = questionContent; }

        public String getBibleRef() { return bibleRef; }
        public void setBibleRef(String bibleRef) { this.bibleRef = bibleRef; }

        public List<OptionDTO> getOptions() { return options; }
        public void setOptions(List<OptionDTO> options) { this.options = options; }

        public Integer getSelectedOptionId() { return selectedOptionId; }
        public void setSelectedOptionId(Integer selectedOptionId) { this.selectedOptionId = selectedOptionId; }

        public boolean isCorrect() { return correct; }
        public void setCorrect(boolean correct) { this.correct = correct; }
    }

    // ── Getters and Setters ──
    public Long getRoundId() { return roundId; }
    public void setRoundId(Long roundId) { this.roundId = roundId; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }

    public int getTotalQuestions() { return totalQuestions; }
    public void setTotalQuestions(int totalQuestions) { this.totalQuestions = totalQuestions; }

    public LocalDateTime getCompletedAt() { return completedAt; }
    public void setCompletedAt(LocalDateTime completedAt) { this.completedAt = completedAt; }

    public List<AnswerDetailDTO> getAnswers() { return answers; }
    public void setAnswers(List<AnswerDetailDTO> answers) { this.answers = answers; }
}
