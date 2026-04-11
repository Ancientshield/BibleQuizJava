package com.biblequiz.app.controller;

import com.biblequiz.app.dto.CategoryRequest;
import com.biblequiz.app.entity.QuestionCategory;
import com.biblequiz.app.repository.QuestionCategoryRepository;
import com.biblequiz.app.repository.QuestionRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

/**
 * 分類管理 Controller — ADMIN 專用。
 *
 * 分類是固定 taxonomy（原本 8 類），但為了支援未來擴充
 * （海德堡要理問答 / 使徒信經 / 教會歷史 等新主題），
 * 留一套 CRUD API 讓管理者透過後端端點新增 / 改名 / 刪除，
 * 避免每次都要手動進 DB 下 SQL。
 *
 * 只做後端 API，不做 admin UI —— 管理者用 curl / Postman / gh 打就好。
 *
 * DELETE 的 FK 保護：分類底下有題目就拒絕刪除，避免 DB constraint violation
 * 拋出難懂的錯誤訊息，也避免題目失去分類變成孤兒。
 */
@Tag(name = "管理者 — 分類管理", description = "新增 / 改名 / 刪除題目分類")
@RestController
@RequestMapping("/api/admin/categories")
public class AdminCategoryController {

    private final QuestionCategoryRepository categoryRepository;
    private final QuestionRepository questionRepository;

    public AdminCategoryController(QuestionCategoryRepository categoryRepository,
                                   QuestionRepository questionRepository) {
        this.categoryRepository = categoryRepository;
        this.questionRepository = questionRepository;
    }

    @Operation(summary = "取得所有分類", description = "依 sortOrder 排序")
    @GetMapping
    public ResponseEntity<List<QuestionCategory>> list() {
        return ResponseEntity.ok(categoryRepository.findAll(Sort.by("sortOrder")));
    }

    @Operation(summary = "新增分類", description = "sortOrder 不填會自動設為目前最大 + 1")
    @PostMapping
    public ResponseEntity<QuestionCategory> create(@RequestBody CategoryRequest request) {
        String name = normalizeName(request.getName());
        QuestionCategory entity = new QuestionCategory();
        entity.setName(name);
        entity.setSortOrder(request.getSortOrder() != null ? request.getSortOrder() : nextSortOrder());
        return ResponseEntity.status(HttpStatus.CREATED).body(categoryRepository.save(entity));
    }

    @Operation(summary = "編輯分類", description = "name / sortOrder 擇一填即可，沒傳的欄位不動")
    @PatchMapping("/{id}")
    public ResponseEntity<QuestionCategory> update(@PathVariable Short id,
                                                    @RequestBody CategoryRequest request) {
        QuestionCategory entity = categoryRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "分類不存在：" + id));

        if (request.getName() != null) {
            entity.setName(normalizeName(request.getName()));
        }
        if (request.getSortOrder() != null) {
            entity.setSortOrder(request.getSortOrder());
        }
        return ResponseEntity.ok(categoryRepository.save(entity));
    }

    @Operation(summary = "刪除分類", description = "底下還有題目就 409 拒絕，避免題目變孤兒")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Short id) {
        if (!categoryRepository.existsById(id)) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "分類不存在：" + id);
        }
        if (questionRepository.existsByCategory_Id(id)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT,
                    "該分類底下還有題目，請先把題目遷移到其他分類再刪除");
        }
        categoryRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    // name 空字串 / null / 純空白一律視為非法
    private String normalizeName(String raw) {
        if (raw == null || raw.trim().isEmpty()) {
            throw new IllegalArgumentException("分類名稱不能為空");
        }
        return raw.trim();
    }

    // 找目前最大 sortOrder + 1，讓新分類自動接在最後
    private Short nextSortOrder() {
        return categoryRepository.findAll(Sort.by(Sort.Direction.DESC, "sortOrder")).stream()
                .findFirst()
                .map(c -> (short) (c.getSortOrder() + 1))
                .orElse((short) 1);
    }
}
