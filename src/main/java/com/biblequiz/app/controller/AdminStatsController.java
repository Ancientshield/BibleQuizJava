package com.biblequiz.app.controller;

import com.biblequiz.app.dto.OverviewStatsDTO;
import com.biblequiz.app.dto.QuestionStatsDTO;
import com.biblequiz.app.service.QuestionStatsService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/** 管理者統計 Controller — 全站總覽、題目答對率、選項分佈。 */
@Tag(name = "管理者 — 統計", description = "全站總覽、題目統計、選項分佈")
@RestController
@RequestMapping("/api/admin/stats")
public class AdminStatsController {

    private final QuestionStatsService questionStatsService;

    public AdminStatsController(QuestionStatsService questionStatsService) {
        this.questionStatsService = questionStatsService;
    }

    @Operation(summary = "全站總覽", description = "總遊戲次數、上架題目數、全站平均答對率")
    @GetMapping("/overview")
    public ResponseEntity<OverviewStatsDTO> overview() {
        return ResponseEntity.ok(questionStatsService.getOverview());
    }

    @Operation(summary = "全部題目統計", description = "每題的被答次數、答對率（可用來排序找出最難 / 最簡單的題目）")
    @GetMapping("/questions")
    public ResponseEntity<List<QuestionStatsDTO>> allQuestionStats() {
        return ResponseEntity.ok(questionStatsService.getAllQuestionStats());
    }

    @Operation(summary = "單題詳細統計", description = "含選項分佈（每個選項被選了幾次）+ 最常被選的錯誤選項")
    @GetMapping("/questions/{id}")
    public ResponseEntity<QuestionStatsDTO> questionStats(@PathVariable Integer id) {
        return ResponseEntity.ok(questionStatsService.getQuestionStats(id));
    }
}
