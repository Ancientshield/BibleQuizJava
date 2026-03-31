package com.biblequiz.app.controller;

import com.biblequiz.app.dto.QuestionCreateRequest;
import com.biblequiz.app.dto.QuestionDetailDTO;
import com.biblequiz.app.dto.QuestionUpdateRequest;
import com.biblequiz.app.service.QuestionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/** 題目 CRUD Controller — 所有登入使用者共用（權限差異在 Service 層處理）。 */
@Tag(name = "題目管理", description = "投稿、編輯、刪除題目")
@RestController
@RequestMapping("/api/questions")
public class QuestionController {

    private final QuestionService questionService;

    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @Operation(summary = "新增題目", description = "投稿一道題目，status 為 PENDING 等待管理者審核")
    @PostMapping
    public ResponseEntity<QuestionDetailDTO> create(@RequestBody QuestionCreateRequest request) {
        Long userId = getCurrentUserId();
        QuestionDetailDTO result = questionService.create(request, userId);
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @Operation(summary = "查看單一題目", description = "取得題目詳情（編輯頁用）")
    @GetMapping("/{id}")
    public ResponseEntity<QuestionDetailDTO> getQuestion(@PathVariable Integer id) {
        Long userId = getCurrentUserId();
        boolean isAdmin = isCurrentUserAdmin();
        QuestionDetailDTO result = questionService.getQuestion(id, userId, isAdmin);
        return ResponseEntity.ok(result);
    }

    @Operation(summary = "查看我的題目", description = "列出當前使用者投稿的所有題目")
    @GetMapping("/mine")
    public ResponseEntity<List<QuestionDetailDTO>> getMyQuestions() {
        Long userId = getCurrentUserId();
        List<QuestionDetailDTO> result = questionService.getMyQuestions(userId);
        return ResponseEntity.ok(result);
    }

    @Operation(summary = "編輯題目", description = "使用者只能編輯自己的 PENDING 題目，管理者不限")
    @PutMapping("/{id}")
    public ResponseEntity<QuestionDetailDTO> update(@PathVariable Integer id,
                                                     @RequestBody QuestionUpdateRequest request) {
        Long userId = getCurrentUserId();
        boolean isAdmin = isCurrentUserAdmin();
        QuestionDetailDTO result = questionService.update(id, request, userId, isAdmin);
        return ResponseEntity.ok(result);
    }

    @Operation(summary = "刪除題目", description = "使用者只能刪除自己的 PENDING 題目，管理者不限")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Integer id) {
        Long userId = getCurrentUserId();
        boolean isAdmin = isCurrentUserAdmin();
        questionService.delete(id, userId, isAdmin);
        return ResponseEntity.noContent().build();
    }

    // ── 從 SecurityContext 取得當前使用者資訊 ──

    private Long getCurrentUserId() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return (Long) auth.getPrincipal();
    }

    private boolean isCurrentUserAdmin() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));
    }
}
