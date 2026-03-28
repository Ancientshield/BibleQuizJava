package com.biblequiz.app.repository;

import com.biblequiz.app.entity.QuestionCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionCategoryRepository extends JpaRepository<QuestionCategory, Short> {
}
