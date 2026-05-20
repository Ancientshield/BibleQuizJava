package com.biblequiz.app.controller;

import com.biblequiz.app.dto.QuizSubmitRequest;
import com.biblequiz.app.entity.QuizRound;
import com.biblequiz.app.service.GuestUserInitializer;
import com.biblequiz.app.service.QuizRoundService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@Tag(name = "訪客遊戲", description = "未登入使用者提交作答結果(掛在 guest sentinel 帳號下,用於擴大投票/答對率統計樣本)")
@RestController
@RequestMapping("/api/guest/quiz")
public class GuestQuizController {

    private final QuizRoundService quizRoundService;
    private final GuestUserInitializer guestUserInitializer;

    public GuestQuizController(QuizRoundService quizRoundService,
                               GuestUserInitializer guestUserInitializer) {
        this.quizRoundService = quizRoundService;
        this.guestUserInitializer = guestUserInitializer;
    }

    @Operation(summary = "提交一局訪客作答結果",
               description = "未登入使用者答完 10 題後 POST 整局結果,後端用 guest sentinel userId 寫入 round + answer_log,不累加 total_score")
    @PostMapping("/submit")
    public ResponseEntity<?> submitQuiz(@RequestBody QuizSubmitRequest request) {
        Long guestUserId = guestUserInitializer.getGuestUserId();
        QuizRound round = quizRoundService.submitQuiz(guestUserId, request, true);
        return ResponseEntity.ok(Map.of(
                "message", "訪客作答紀錄已儲存",
                "roundId", round.getId(),
                "score", round.getScore(),
                "totalQuestions", round.getTotalQuestions()
        ));
    }
}
