package com.biblequiz.app.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

/** 一局遊戲 Entity — 對應 quiz_round 資料表。 */
@Entity
@Table(name = "quiz_round")
public class QuizRound {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(nullable = false)
    private Integer score;

    @Column(name = "total_questions", nullable = false)
    private Integer totalQuestions = 10;

    @Column(name = "completed_at", nullable = false, updatable = false)
    private LocalDateTime completedAt;

    @OneToMany(mappedBy = "round", cascade = CascadeType.ALL)
    private List<QuizAnswerLog> answerLogs;

    @PrePersist
    protected void onCreate() {
        completedAt = LocalDateTime.now();
    }

    // ── Getters and Setters ──
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }

    public Integer getScore() { return score; }
    public void setScore(Integer score) { this.score = score; }

    public Integer getTotalQuestions() { return totalQuestions; }
    public void setTotalQuestions(Integer totalQuestions) { this.totalQuestions = totalQuestions; }

    public LocalDateTime getCompletedAt() { return completedAt; }

    public List<QuizAnswerLog> getAnswerLogs() { return answerLogs; }
    public void setAnswerLogs(List<QuizAnswerLog> answerLogs) { this.answerLogs = answerLogs; }
}
