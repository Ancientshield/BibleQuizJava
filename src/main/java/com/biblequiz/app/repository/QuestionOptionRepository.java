package com.biblequiz.app.repository;

import com.biblequiz.app.entity.QuestionOption;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 選項 Repository — 繼承 JpaRepository 自動獲得 CRUD。
 * 目前只需基本 CRUD，後續管理功能會擴充。
 */
public interface QuestionOptionRepository extends JpaRepository<QuestionOption, Integer> {
}
