package com.biblequiz.app.controller;

import com.biblequiz.app.dto.AdminPublishRequest;
import com.biblequiz.app.dto.AdminQuestionUpdateRequest;
import com.biblequiz.app.dto.QuestionDetailDTO;
import com.biblequiz.app.entity.BibleBook;
import com.biblequiz.app.entity.QuestionCategory;
import com.biblequiz.app.entity.QuestionStatus;
import com.biblequiz.app.repository.BibleBookRepository;
import com.biblequiz.app.repository.QuestionCategoryRepository;
import com.biblequiz.app.service.QuestionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

/** 管理者題目管理 Controller — 篩選、分頁、審核、編輯、刪除。 */
@Tag(name = "管理者 — 題目管理", description = "篩選搜尋、核准上架、退回、編輯、刪除")
@RestController
@RequestMapping("/api/admin/questions")
public class AdminQuestionController {

    private final QuestionService questionService;
    private final QuestionCategoryRepository questionCategoryRepository;
    private final BibleBookRepository bibleBookRepository;

    public AdminQuestionController(QuestionService questionService,
                                   QuestionCategoryRepository questionCategoryRepository,
                                   BibleBookRepository bibleBookRepository) {
        this.questionService = questionService;
        this.questionCategoryRepository = questionCategoryRepository;
        this.bibleBookRepository = bibleBookRepository;
    }

    @Operation(summary = "取得所有分類", description = "篩選/審核下拉選單用（8 類）")
    @GetMapping("/categories")
    public ResponseEntity<List<QuestionCategory>> listCategories() {
        return ResponseEntity.ok(questionCategoryRepository.findAll(Sort.by("sortOrder")));
    }

    @Operation(summary = "取得所有書卷", description = "審核/編輯下拉選單用（66 卷）")
    @GetMapping("/bible-books")
    public ResponseEntity<List<BibleBook>> listBibleBooks() {
        return ResponseEntity.ok(bibleBookRepository.findAll(Sort.by("sortOrder")));
    }

    @Operation(summary = "搜尋題目（分頁）", description = "7 個篩選條件 + 分頁，預設按建立時間降序")
    @GetMapping
    public ResponseEntity<Page<QuestionDetailDTO>> listQuestions(
            @RequestParam(required = false) QuestionStatus status,
            @RequestParam(required = false) Short categoryId,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String optionKeyword,
            @RequestParam(required = false) String author,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateFrom,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateTo,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "false") boolean includeStats) {

        PageRequest pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "createdAt"));
        Page<QuestionDetailDTO> result = questionService.searchQuestions(
                status, categoryId, keyword, optionKeyword, author, dateFrom, dateTo, includeStats, pageable);
        return ResponseEntity.ok(result);
    }

    @Operation(summary = "核准上架", description = "指定 categoryId + 經文出處 → PUBLISHED")
    @PatchMapping("/{id}/publish")
    public ResponseEntity<QuestionDetailDTO> publish(@PathVariable Integer id,
                                                      @RequestBody AdminPublishRequest request) {
        return ResponseEntity.ok(questionService.publish(id, request));
    }

    @Operation(summary = "退回題目", description = "狀態改為 REJECTED")
    @PatchMapping("/{id}/reject")
    public ResponseEntity<QuestionDetailDTO> reject(@PathVariable Integer id) {
        return ResponseEntity.ok(questionService.reject(id));
    }

    @Operation(summary = "編輯題目", description = "修改內容、選項、分類、經文出處（不改狀態）")
    @PutMapping("/{id}")
    public ResponseEntity<QuestionDetailDTO> update(@PathVariable Integer id,
                                                     @RequestBody AdminQuestionUpdateRequest request) {
        return ResponseEntity.ok(questionService.adminUpdate(id, request));
    }

    @Operation(summary = "刪除題目", description = "硬刪除，不限狀態")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Integer id) {
        questionService.adminDelete(id);
        return ResponseEntity.noContent().build();
    }
}
