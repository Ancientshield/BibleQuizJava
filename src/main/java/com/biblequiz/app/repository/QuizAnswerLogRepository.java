package com.biblequiz.app.repository;

import com.biblequiz.app.entity.QuizAnswerLog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuizAnswerLogRepository extends JpaRepository<QuizAnswerLog, Long> {
}
