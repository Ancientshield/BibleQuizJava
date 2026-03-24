package com.biblequiz.app.service;

import com.biblequiz.app.dto.AnswerResultDTO;
import com.biblequiz.app.dto.QuestionDTO;
import com.biblequiz.app.entity.Question;
import com.biblequiz.app.repository.QuestionRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.Collections;

/**
 * 聖經問答 Service — 業務邏輯層。
 * 打亂題目、驗答、Entity → DTO 轉換。
 */
@Service
public class BibleQuizService {

    private final QuestionRepository questionRepository; // 建構子注入

    public BibleQuizService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    /** 取得所有題目（不含正確答案） */
    public List<QuestionDTO> getAllQuestions() {
        List<Question> questions = questionRepository.findAll();
        return questions.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /** 隨機取得 N 題（撈全部 → 打亂 → 取前 N 筆） */
    public List<QuestionDTO> getRandomQuestions(int count) {
        List<Question> allQuestions = questionRepository.findAll();
        Collections.shuffle(allQuestions);

        return allQuestions.stream()
                .limit(count)
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /** Entity → DTO，刻意不帶 correctAnswer */
    private QuestionDTO convertToDTO(Question question) {
        QuestionDTO dto = new QuestionDTO();
        dto.setId(question.getId());
        dto.setContent(question.getContent());
        dto.setOptionA(question.getOptionA());
        dto.setOptionB(question.getOptionB());
        dto.setOptionC(question.getOptionC());
        dto.setOptionD(question.getOptionD());
        // 刻意不設定 correctAnswer！
        return dto;
    }

    /** 檢查答案，回傳對錯 + 正確答案 */
    public AnswerResultDTO checkAnswer(Integer questionId, String answer) {
        Question question = questionRepository.findById(questionId).orElse(null);
        if (question == null) {
            return new AnswerResultDTO(false, null);
        }
        boolean isCorrect = question.getCorrectAnswer().equalsIgnoreCase(answer);
        return new AnswerResultDTO(isCorrect, question.getCorrectAnswer());
    }
}
