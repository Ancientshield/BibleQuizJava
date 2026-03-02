package com.biblequiz.app.service;

import com.biblequiz.app.dto.QuestionDTO;
import com.biblequiz.app.entity.Question;
import com.biblequiz.app.repository.QuestionRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.Collections;

@Service
public class BibleQuizService {

    private final QuestionRepository questionRepository;

    public BibleQuizService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    // 取得所有題目（不含答案）
    public List<QuestionDTO> getAllQuestions() {
        List<Question> questions = questionRepository.findAll();
        return questions.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    // 隨機取得 N 題（不含答案）
    public List<QuestionDTO> getRandomQuestions(int count) {
        List<Question> allQuestions = questionRepository.findAll();
        Collections.shuffle(allQuestions);  // 打亂順序

        return allQuestions.stream()
                .limit(count)  // 只取前 N 筆
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    // Entity 轉 DTO
    private QuestionDTO convertToDTO(Question question) {
        QuestionDTO dto = new QuestionDTO();
        dto.setId(question.getId());
        dto.setContent(question.getContent());
        dto.setOptionA(question.getOptionA());
        dto.setOptionB(question.getOptionB());
        dto.setOptionC(question.getOptionC());
        dto.setOptionD(question.getOptionD());
        // 不設定 correctAnswer！
        return dto;
    }

    // 檢查答案
    public boolean checkAnswer(Integer questionId, String answer) {
        Question question = questionRepository.findById(questionId).orElse(null);
        if (question == null) {
            return false;
        }
        return question.getCorrectAnswer().equalsIgnoreCase(answer);
    }
}
