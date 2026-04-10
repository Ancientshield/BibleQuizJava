package com.biblequiz.app.repository;

import com.biblequiz.app.entity.QuizRound;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuizRoundRepository extends JpaRepository<QuizRound, Long> {

    // ── G-6：統計查詢 ──

    // 使用者的遊戲歷史（新到舊）
    List<QuizRound> findByUserIdOrderByCompletedAtDesc(Long userId);

    // 使用者個人統計（回傳 [totalGames, avgScore, perfectGames]）
    @Query("SELECT COUNT(r), COALESCE(AVG(r.score), 0), " +
           "SUM(CASE WHEN r.score = r.totalQuestions THEN 1 ELSE 0 END) " +
           "FROM QuizRound r WHERE r.userId = :userId")
    Object[] findUserStats(@Param("userId") Long userId);
}
