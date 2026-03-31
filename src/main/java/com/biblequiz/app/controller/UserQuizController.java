package com.biblequiz.app.controller;

import com.biblequiz.app.dto.QuizSubmitRequest;
import com.biblequiz.app.entity.QuizRound;
import com.biblequiz.app.service.QuizRoundService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Tag(name = "使用者遊戲", description = "提交作答結果")
@RestController
@RequestMapping("/api/user/quiz")
public class UserQuizController {

    private final QuizRoundService quizRoundService;

    public UserQuizController(QuizRoundService quizRoundService) {
        this.quizRoundService = quizRoundService;
    }

    @Operation(summary = "提交一局作答結果", description = "答完 10 題後，前端 POST 整局結果，後端寫入 round + answer_log")
    @PostMapping("/submit")
    public ResponseEntity<?> submitQuiz(@RequestBody QuizSubmitRequest request) {
        Long userId = (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        QuizRound round = quizRoundService.submitQuiz(userId, request);
        return ResponseEntity.ok(Map.of(
                "message", "作答紀錄已儲存",
                "roundId", round.getId(),
                "score", round.getScore(),
                "totalQuestions", round.getTotalQuestions()
        ));
    }
}
