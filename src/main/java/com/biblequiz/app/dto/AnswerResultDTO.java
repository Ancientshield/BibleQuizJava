package com.biblequiz.app.dto;

/**
 * 驗答結果 DTO — POST /api/biblequiz/check 的回傳值。
 * JSON：{ "correct": true/false, "correctAnswer": "A" }
 */
public class AnswerResultDTO {
    private boolean correct;
    private String correctAnswer; // "A" / "B" / "C" / "D"

    public AnswerResultDTO(boolean correct, String correctAnswer) {
        this.correct = correct;
        this.correctAnswer = correctAnswer;
    }

    // ── Getters and Setters ──

    public boolean isCorrect() { return correct; }
    public void setCorrect(boolean correct) { this.correct = correct; }

    public String getCorrectAnswer() { return correctAnswer; }
    public void setCorrectAnswer(String correctAnswer) { this.correctAnswer = correctAnswer; }
}
