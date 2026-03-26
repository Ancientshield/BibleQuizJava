package com.biblequiz.app.repository;

import com.biblequiz.app.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 題目 Repository — 繼承 JpaRepository 自動獲得 CRUD。
 * 泛型：Question（Entity 類型）, Integer（主鍵型別）
 */
public interface QuestionRepository extends JpaRepository<Question, Integer> {

    /**
     * 一次撈出所有題目 + 選項，避免 N+1 問題。
     * open-in-view=false 下，LAZY 關聯在 Service 層存取會拋 LazyInitializationException，
     * 所以用 JOIN FETCH 在一條 SQL 就把 question + options 一起撈出來。
     */
    @Query("SELECT DISTINCT q FROM Question q JOIN FETCH q.options")
    List<Question> findAllWithOptions();
}
