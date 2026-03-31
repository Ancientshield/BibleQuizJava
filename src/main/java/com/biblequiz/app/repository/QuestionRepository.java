package com.biblequiz.app.repository;

import com.biblequiz.app.entity.Question;
import com.biblequiz.app.entity.QuestionStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

/** 題目 Repository — JOIN FETCH 一次撈題目 + 選項 + 分類 + 書卷，避免 N+1。 */
public interface QuestionRepository extends JpaRepository<Question, Integer> {

    @Query("SELECT DISTINCT q FROM Question q " +
           "JOIN FETCH q.options " +
           "LEFT JOIN FETCH q.category " +
           "LEFT JOIN FETCH q.bibleBook")
    List<Question> findAllWithOptions();

    @Query("SELECT DISTINCT q FROM Question q " +
           "JOIN FETCH q.options " +
           "LEFT JOIN FETCH q.category " +
           "LEFT JOIN FETCH q.bibleBook " +
           "WHERE q.status = :status")
    List<Question> findAllWithOptionsByStatus(@Param("status") QuestionStatus status);

    // ── G-2：題目 CRUD 用 ──

    @Query("SELECT DISTINCT q FROM Question q " +
           "JOIN FETCH q.options " +
           "LEFT JOIN FETCH q.category " +
           "LEFT JOIN FETCH q.bibleBook " +
           "WHERE q.id = :id")
    Optional<Question> findByIdWithOptions(@Param("id") Integer id);

    @Query("SELECT DISTINCT q FROM Question q " +
           "JOIN FETCH q.options " +
           "LEFT JOIN FETCH q.category " +
           "LEFT JOIN FETCH q.bibleBook " +
           "WHERE q.createdBy = :userId " +
           "ORDER BY q.createdAt DESC")
    List<Question> findAllWithOptionsByCreatedBy(@Param("userId") Long userId);

    int countByCreatedByAndStatus(Long createdBy, QuestionStatus status);

    // ── G-6：統計用 ──

    int countByStatus(QuestionStatus status);
}
