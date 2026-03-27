package com.biblequiz.app.repository;

import com.biblequiz.app.entity.QuestionOption;
import org.springframework.data.jpa.repository.JpaRepository;

/** 選項 Repository — 基本 CRUD，Phase G 統計用。 */
public interface QuestionOptionRepository extends JpaRepository<QuestionOption, Integer> {
}
