package com.biblequiz.app.service;

import com.biblequiz.app.dto.QuestionDTO;
import com.biblequiz.app.entity.Question;
import com.biblequiz.app.entity.QuestionOption;
import com.biblequiz.app.repository.QuestionRepository;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 聖經問答 Service — 業務邏輯層。
 * 打亂題目、Entity → DTO 轉換。
 * Phase E 移除了 checkAnswer()，前端改為本地驗答。
 */
@Service
public class BibleQuizService {

    private final QuestionRepository questionRepository;

    public BibleQuizService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    /** 取得所有題目（含選項與答案） */
    public List<QuestionDTO> getAllQuestions() {
        List<Question> questions = questionRepository.findAllWithOptions();
        return questions.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /** 隨機取得 N 題（撈全部 → 打亂 → 取前 N 筆） */
    public List<QuestionDTO> getRandomQuestions(int count) {
        List<Question> allQuestions = questionRepository.findAllWithOptions();
        Collections.shuffle(allQuestions);

        return allQuestions.stream()
                .limit(count)
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /** Entity → DTO，映射 Question + List<QuestionOption> 到新 QuestionDTO */
    private QuestionDTO convertToDTO(Question question) {
        QuestionDTO dto = new QuestionDTO();
        dto.setId(question.getId());
        dto.setContent(question.getContent());

        List<QuestionDTO.OptionDTO> optionDTOs = question.getOptions().stream()
                .map(this::convertOptionToDTO)
                .collect(Collectors.toList());
        dto.setOptions(optionDTOs);

        return dto;
    }

    /** QuestionOption Entity → OptionDTO */
    private QuestionDTO.OptionDTO convertOptionToDTO(QuestionOption option) {
        QuestionDTO.OptionDTO dto = new QuestionDTO.OptionDTO();
        dto.setId(option.getId());
        dto.setContent(option.getContent());
        dto.setIsCorrect(option.getIsCorrect());
        return dto;
    }
}
