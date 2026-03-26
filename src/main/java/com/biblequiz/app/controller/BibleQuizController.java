package com.biblequiz.app.controller;

import com.biblequiz.app.dto.QuestionDTO;
import com.biblequiz.app.service.BibleQuizService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 聖經問答 API Controller。
 * 只負責接收請求、呼叫 Service、回傳結果。
 * Phase E 移除了 POST /check，前端改為本地驗答。
 */
@RestController
@RequestMapping("/api/biblequiz")
public class BibleQuizController {

    private final BibleQuizService bibleQuizService;

    public BibleQuizController(BibleQuizService bibleQuizService) {
        this.bibleQuizService = bibleQuizService;
    }

    /** 開始一局遊戲，隨機取 10 題（含答案） */
    @GetMapping("/start")
    public List<QuestionDTO> startQuiz() {
        return bibleQuizService.getRandomQuestions(10);
    }
}
