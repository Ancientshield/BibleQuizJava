package com.biblequiz.app.controller;

import com.biblequiz.app.dto.AnswerResultDTO;
import com.biblequiz.app.dto.QuestionDTO;
import com.biblequiz.app.service.BibleQuizService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 聖經問答 API Controller。
 * 只負責接收請求、呼叫 Service、回傳結果。
 */
@RestController
@RequestMapping("/api/biblequiz")
public class BibleQuizController {

    private final BibleQuizService bibleQuizService; // 建構子注入

    public BibleQuizController(BibleQuizService bibleQuizService) {
        this.bibleQuizService = bibleQuizService;
    }

    /** 取得所有題目（開發/管理用途） */
    @GetMapping("/questions")
    public List<QuestionDTO> getQuestions() {
        return bibleQuizService.getAllQuestions();
    }

    /** 開始一局遊戲，隨機取 10 題 */
    @GetMapping("/start")
    public List<QuestionDTO> startQuiz() {
        return bibleQuizService.getRandomQuestions(10);
    }

    /** 驗證答案，回傳對錯 + 正確答案 */
    @PostMapping("/check")
    public AnswerResultDTO checkAnswer(@RequestParam Integer questionId, @RequestParam String answer) {
        return bibleQuizService.checkAnswer(questionId, answer);
    }
}
