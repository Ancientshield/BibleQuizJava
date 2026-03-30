package com.biblequiz.app.repository;

import com.biblequiz.app.entity.QuizRound;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuizRoundRepository extends JpaRepository<QuizRound, Long> {
}
