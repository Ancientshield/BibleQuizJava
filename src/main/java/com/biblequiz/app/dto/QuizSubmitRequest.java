package com.biblequiz.app.dto;

import java.util.List;

/** 前端答完一局後 POST 的結果。 */
public class QuizSubmitRequest {

    private int score;
    private List<AnswerEntry> answers;

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }

    public List<AnswerEntry> getAnswers() { return answers; }
    public void setAnswers(List<AnswerEntry> answers) { this.answers = answers; }

    public static class AnswerEntry {
        private Integer questionId;
        private Integer selectedOptionId;

        public Integer getQuestionId() { return questionId; }
        public void setQuestionId(Integer questionId) { this.questionId = questionId; }

        public Integer getSelectedOptionId() { return selectedOptionId; }
        public void setSelectedOptionId(Integer selectedOptionId) { this.selectedOptionId = selectedOptionId; }
    }
}
