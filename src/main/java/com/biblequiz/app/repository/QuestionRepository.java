package com.biblequiz.app.repository;

import com.biblequiz.app.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 題目 Repository — 繼承 JpaRepository 自動獲得 CRUD。
 * 泛型：Question（Entity 類型）, Integer（主鍵型別）
 */
public interface QuestionRepository extends JpaRepository<Question, Integer> {
}
