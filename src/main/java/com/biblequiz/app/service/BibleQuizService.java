package com.biblequiz.app.service;

import com.biblequiz.app.dto.OptionDTO;
import com.biblequiz.app.dto.QuestionDTO;
import com.biblequiz.app.entity.BibleBook;
import com.biblequiz.app.entity.Question;
import com.biblequiz.app.entity.QuestionCategory;
import com.biblequiz.app.entity.QuestionOption;
import com.biblequiz.app.repository.QuestionRepository;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/** 聖經問答 Service — 撈題目 + Entity→DTO 轉換。 */
@Service
public class BibleQuizService {

    private final QuestionRepository questionRepository;

    public BibleQuizService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    /** 取得所有題目（含選項 + isCorrect） */
    public List<QuestionDTO> getAllQuestions() {
        return questionRepository.findAllWithOptions().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /** 隨機取得 N 題（撈全部 → 打亂 → 取前 N 筆） */
    public List<QuestionDTO> getRandomQuestions(int count) {
        List<Question> all = questionRepository.findAllWithOptions();
        Collections.shuffle(all);
        return all.stream()
                .limit(count)
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    /** Entity → DTO，包含所有選項和 isCorrect */
    private QuestionDTO convertToDTO(Question question) {
        QuestionDTO dto = new QuestionDTO();
        dto.setId(question.getId());
        dto.setContent(question.getContent());

        QuestionCategory category = question.getCategory();
        dto.setCategory(category != null ? category.getName() : null);

        dto.setBibleRef(buildBibleRef(question));

        List<OptionDTO> optionDTOs = question.getOptions().stream()
                .map(this::convertOptionToDTO)
                .collect(Collectors.toList());
        dto.setOptions(optionDTOs);

        return dto;
    }

    /**
     * 從結構化欄位組出經文出處字串。
     * 例如：「創世記 6:14」或「創世記 6:14-16」
     */
    private String buildBibleRef(Question question) {
        BibleBook book = question.getBibleBook();
        if (book == null) return null;

        StringBuilder sb = new StringBuilder(book.getName());

        if (question.getBibleChapter() != null) {
            sb.append(' ').append(question.getBibleChapter());

            if (question.getBibleVerseStart() != null) {
                sb.append(':').append(question.getBibleVerseStart());

                if (question.getBibleVerseEnd() != null) {
                    sb.append('-').append(question.getBibleVerseEnd());
                }
            }
        }

        return sb.toString();
    }

    private OptionDTO convertOptionToDTO(QuestionOption option) {
        OptionDTO dto = new OptionDTO();
        dto.setId(option.getId());
        dto.setContent(option.getContent());
        dto.setCorrect(option.getIsCorrect());
        return dto;
    }
}
