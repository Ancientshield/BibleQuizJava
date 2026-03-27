package com.biblequiz.app.controller;

import com.biblequiz.app.dto.QuestionDTO;
import com.biblequiz.app.service.BibleQuizService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/** 聖經問答 API Controller — Phase E 後只剩 GET 端點，前端本地驗答。 */
@RestController
@RequestMapping("/api/biblequiz")
public class BibleQuizController {

    private final BibleQuizService bibleQuizService;

    public BibleQuizController(BibleQuizService bibleQuizService) {
        this.bibleQuizService = bibleQuizService;
    }

    /** 取得所有題目（開發/管理用途） */
    @GetMapping("/questions")
    public List<QuestionDTO> getQuestions() {
        return bibleQuizService.getAllQuestions();
    }

    /** 開始一局遊戲，隨機取 10 題（含答案，前端本地驗答） */
    @GetMapping("/start")
    public List<QuestionDTO> startQuiz() {
        return bibleQuizService.getRandomQuestions(10);
    }
}
