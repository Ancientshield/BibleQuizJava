package com.biblequiz.app.repository;

import com.biblequiz.app.entity.QuizAnswerLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuizAnswerLogRepository extends JpaRepository<QuizAnswerLog, Long> {

    // ── G-6：統計查詢 ──

    // 每題的被答次數 + 答對次數（回傳 [questionId, totalCount, correctCount]）
    @Query("SELECT a.questionId, COUNT(a), SUM(CASE WHEN a.isCorrect = true THEN 1 ELSE 0 END) " +
           "FROM QuizAnswerLog a GROUP BY a.questionId")
    List<Object[]> findQuestionStats();

    // 單題的選項分佈（回傳 [selectedOptionId, count]）
    @Query("SELECT a.selectedOptionId, COUNT(a) FROM QuizAnswerLog a " +
           "WHERE a.questionId = :questionId GROUP BY a.selectedOptionId")
    List<Object[]> findOptionDistributionByQuestionId(@Param("questionId") Integer questionId);

    // 全站答對率（回傳 [totalAnswers, correctAnswers]）
    @Query("SELECT COUNT(a), SUM(CASE WHEN a.isCorrect = true THEN 1 ELSE 0 END) FROM QuizAnswerLog a")
    Object[] findOverallAccuracy();

    // 批次：指定題目 ID 的被答次數 + 答對次數
    @Query("SELECT a.questionId, COUNT(a), SUM(CASE WHEN a.isCorrect = true THEN 1 ELSE 0 END) " +
           "FROM QuizAnswerLog a WHERE a.questionId IN :ids GROUP BY a.questionId")
    List<Object[]> findQuestionStatsByIds(@Param("ids") List<Integer> ids);

    // 批次：指定題目 ID 的選項分佈
    @Query("SELECT a.questionId, a.selectedOptionId, COUNT(a) " +
           "FROM QuizAnswerLog a WHERE a.questionId IN :ids " +
           "GROUP BY a.questionId, a.selectedOptionId")
    List<Object[]> findOptionDistributionByIds(@Param("ids") List<Integer> ids);
}
