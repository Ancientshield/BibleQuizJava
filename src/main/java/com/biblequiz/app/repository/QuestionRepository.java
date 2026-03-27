package com.biblequiz.app.repository;

import com.biblequiz.app.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/** 題目 Repository — JOIN FETCH 一次撈題目 + 選項，避免 N+1。 */
public interface QuestionRepository extends JpaRepository<Question, Integer> {

    @Query("SELECT q FROM Question q JOIN FETCH q.options")
    List<Question> findAllWithOptions();
}
