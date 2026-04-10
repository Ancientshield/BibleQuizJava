package com.biblequiz.app.controller;

import com.biblequiz.app.dto.RoundDetailDTO;
import com.biblequiz.app.dto.RoundHistoryDTO;
import com.biblequiz.app.dto.UserStatsDTO;
import com.biblequiz.app.service.UserHistoryService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/** 使用者個人紀錄 Controller — 遊戲歷史、個人統計。 */
@Tag(name = "使用者紀錄", description = "我的遊戲歷史、個人統計")
@RestController
@RequestMapping("/api/user")
public class UserHistoryController {

    private final UserHistoryService userHistoryService;

    public UserHistoryController(UserHistoryService userHistoryService) {
        this.userHistoryService = userHistoryService;
    }

    @Operation(summary = "我的遊戲歷史", description = "每局分數 + 日期，新到舊排序")
    @GetMapping("/history")
    public ResponseEntity<List<RoundHistoryDTO>> history() {
        Long userId = getCurrentUserId();
        return ResponseEntity.ok(userHistoryService.getHistory(userId));
    }

    @Operation(summary = "單局詳細回顧", description = "10 題逐題結果：題目、選項、你選了什麼、正確答案、經文出處")
    @GetMapping("/history/{roundId}")
    public ResponseEntity<RoundDetailDTO> roundDetail(@PathVariable Long roundId) {
        Long userId = getCurrentUserId();
        return ResponseEntity.ok(userHistoryService.getRoundDetail(roundId, userId));
    }

    @Operation(summary = "我的個人統計", description = "總遊戲次數、平均分數、最高分")
    @GetMapping("/stats")
    public ResponseEntity<UserStatsDTO> stats() {
        Long userId = getCurrentUserId();
        return ResponseEntity.ok(userHistoryService.getStats(userId));
    }

    private Long getCurrentUserId() {
        return (Long) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
