package com.biblequiz.app.controller;

import com.biblequiz.app.dto.QuestionDTO;
import com.biblequiz.app.repository.QuizAnswerLogRepository;
import com.biblequiz.app.service.BibleQuizService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Tag(name = "聖經問答", description = "遊戲 API — 取得題目 + 觀眾投票")
@RestController
@RequestMapping("/api/biblequiz")
public class BibleQuizController {

    private final BibleQuizService bibleQuizService;
    private final QuizAnswerLogRepository quizAnswerLogRepository;

    public BibleQuizController(BibleQuizService bibleQuizService,
                               QuizAnswerLogRepository quizAnswerLogRepository) {
        this.bibleQuizService = bibleQuizService;
        this.quizAnswerLogRepository = quizAnswerLogRepository;
    }

    @Operation(summary = "開始一局遊戲", description = "隨機取 10 題，含選項和答案，前端本地驗答")
    @GetMapping("/start")
    public List<QuestionDTO> startQuiz() {
        return bibleQuizService.getRandomQuestions(10);
    }

    @Operation(summary = "觀眾投票", description = "回傳該題歷史選項分佈百分比（道具用）")
    @GetMapping("/poll/{questionId}")
    public List<Map<String, Object>> poll(@PathVariable Integer questionId) {
        List<Object[]> raw = quizAnswerLogRepository.findOptionDistributionByQuestionId(questionId);

        // 算總數
        long total = 0;
        for (Object[] r : raw) total += (Long) r[1];

        List<Map<String, Object>> result = new ArrayList<>();
        if (total == 0) return result;

        for (Object[] r : raw) {
            int optionId = (Integer) r[0];
            long count = (Long) r[1];
            double pct = Math.round((double) count / total * 1000.0) / 10.0;
            result.add(Map.of("optionId", optionId, "percentage", pct));
        }
        return result;
    }
}
