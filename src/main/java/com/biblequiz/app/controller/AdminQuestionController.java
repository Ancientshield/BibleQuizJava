package com.biblequiz.app.controller;

import com.biblequiz.app.dto.AdminPublishRequest;
import com.biblequiz.app.dto.QuestionDetailDTO;
import com.biblequiz.app.entity.BibleBook;
import com.biblequiz.app.entity.QuestionCategory;
import com.biblequiz.app.entity.QuestionStatus;
import com.biblequiz.app.repository.BibleBookRepository;
import com.biblequiz.app.repository.QuestionCategoryRepository;
import com.biblequiz.app.service.QuestionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/** 管理者題目審核 Controller — 列出題目、核准上架、退回。 */
@Tag(name = "管理者 — 題目審核", description = "列出所有題目、核准上架（指定分類+經文）、退回")
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

    @Operation(summary = "取得所有分類", description = "審核時下拉選單用（8 類）")
    @GetMapping("/categories")
    public ResponseEntity<List<QuestionCategory>> listCategories() {
        return ResponseEntity.ok(questionCategoryRepository.findAll(Sort.by("sortOrder")));
    }

    @Operation(summary = "取得所有書卷", description = "審核時下拉選單用（66 卷）")
    @GetMapping("/bible-books")
    public ResponseEntity<List<BibleBook>> listBibleBooks() {
        return ResponseEntity.ok(bibleBookRepository.findAll(Sort.by("sortOrder")));
    }

    @Operation(summary = "列出所有題目", description = "可帶 ?status=PENDING 篩選，不帶則列出全部")
    @GetMapping
    public ResponseEntity<List<QuestionDetailDTO>> listQuestions(
            @RequestParam(required = false) QuestionStatus status) {
        List<QuestionDetailDTO> result = questionService.getAllQuestions(status);
        return ResponseEntity.ok(result);
    }

    @Operation(summary = "核准上架", description = "需指定 categoryId + 經文出處，題目狀態改為 PUBLISHED")
    @PatchMapping("/{id}/publish")
    public ResponseEntity<QuestionDetailDTO> publish(@PathVariable Integer id,
                                                      @RequestBody AdminPublishRequest request) {
        QuestionDetailDTO result = questionService.publish(id, request);
        return ResponseEntity.ok(result);
    }

    @Operation(summary = "退回題目", description = "題目狀態改為 REJECTED")
    @PatchMapping("/{id}/reject")
    public ResponseEntity<QuestionDetailDTO> reject(@PathVariable Integer id) {
        QuestionDetailDTO result = questionService.reject(id);
        return ResponseEntity.ok(result);
    }
}
