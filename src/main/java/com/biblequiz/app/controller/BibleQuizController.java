package com.biblequiz.app.controller;

import com.biblequiz.app.dto.QuestionDTO;
import com.biblequiz.app.service.BibleQuizService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "聖經問答", description = "遊戲 API — 取得題目")
@RestController
@RequestMapping("/api/biblequiz")
public class BibleQuizController {

    private final BibleQuizService bibleQuizService;

    public BibleQuizController(BibleQuizService bibleQuizService) {
        this.bibleQuizService = bibleQuizService;
    }

    @Operation(summary = "取得所有題目", description = "開發 / 管理用途，回傳全部題目含答案")
    @GetMapping("/questions")
    public List<QuestionDTO> getQuestions() {
        return bibleQuizService.getAllQuestions();
    }

    @Operation(summary = "開始一局遊戲", description = "隨機取 10 題，含選項和答案，前端本地驗答")
    @GetMapping("/start")
    public List<QuestionDTO> startQuiz() {
        return bibleQuizService.getRandomQuestions(10);
    }
}
