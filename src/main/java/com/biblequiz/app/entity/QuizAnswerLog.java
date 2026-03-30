package com.biblequiz.app.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

/** 逐題作答紀錄 Entity — 對應 quiz_answer_log 資料表。 */
@Entity
@Table(name = "quiz_answer_log")
public class QuizAnswerLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "round_id", nullable = false)
    private QuizRound round;

    @Column(name = "question_id", nullable = false)
    private Integer questionId;

    @Column(name = "selected_option_id", nullable = false)
    private Integer selectedOptionId;

    @Column(name = "is_correct", nullable = false)
    private Boolean isCorrect;

    @Column(name = "answered_at", nullable = false, updatable = false)
    private LocalDateTime answeredAt;

    @PrePersist
    protected void onCreate() {
        answeredAt = LocalDateTime.now();
    }

    // ── Getters and Setters ──
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public QuizRound getRound() { return round; }
    public void setRound(QuizRound round) { this.round = round; }

    public Integer getQuestionId() { return questionId; }
    public void setQuestionId(Integer questionId) { this.questionId = questionId; }

    public Integer getSelectedOptionId() { return selectedOptionId; }
    public void setSelectedOptionId(Integer selectedOptionId) { this.selectedOptionId = selectedOptionId; }

    public Boolean getIsCorrect() { return isCorrect; }
    public void setIsCorrect(Boolean isCorrect) { this.isCorrect = isCorrect; }

    public LocalDateTime getAnsweredAt() { return answeredAt; }
}
