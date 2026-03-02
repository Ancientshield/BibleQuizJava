package com.biblequiz.app.controller;

import com.biblequiz.app.dto.QuestionDTO;
import com.biblequiz.app.service.BibleQuizService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/bible-quiz")
public class BibleQuizController {

    private final BibleQuizService bibleQuizService;

    public BibleQuizController(BibleQuizService bibleQuizService) {
        this.bibleQuizService = bibleQuizService;
    }

    // 取得所有題目
    @GetMapping("/questions")
    public List<QuestionDTO> getQuestions() {
        return bibleQuizService.getAllQuestions();
    }

    // 取得隨機 10 題
    @GetMapping("/start")
    public List<QuestionDTO> startQuiz() {
        return bibleQuizService.getRandomQuestions(10);
    }

    // 檢查答案
    @PostMapping("/check")
    public boolean checkAnswer(@RequestParam Integer questionId, @RequestParam String answer) {
        return bibleQuizService.checkAnswer(questionId, answer);
    }
}
