package com.biblequiz.app.controller;

import com.biblequiz.app.entity.QuestionCategory;
import com.biblequiz.app.repository.QuestionCategoryRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/** 公開分類 API — 投稿表單用，唯讀。 */
@Tag(name = "分類", description = "公開的分類列表")
@RestController
@RequestMapping("/api/categories")
public class CategoryController {

    private final QuestionCategoryRepository categoryRepository;

    public CategoryController(QuestionCategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Operation(summary = "取得所有分類", description = "依 sortOrder 排序，給投稿表單下拉選單用")
    @GetMapping
    public ResponseEntity<List<QuestionCategory>> list() {
        return ResponseEntity.ok(categoryRepository.findAll(Sort.by("sortOrder")));
    }
}
