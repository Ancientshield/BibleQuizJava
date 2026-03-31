package com.biblequiz.app.dto;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 題目詳情 DTO — CRUD 操作回傳用，比遊戲用的 QuestionDTO 多 status、時間戳等欄位。
 * 前端「我的題目」列表、管理後台都用這個。
 */
public class QuestionDetailDTO {

    private Integer id;
    private String content;
    private String status;
    private String categoryName;
    private String bibleRef;
    private List<OptionDTO> options;
    private Long createdBy;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // ── Getters and Setters ──
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public String getBibleRef() { return bibleRef; }
    public void setBibleRef(String bibleRef) { this.bibleRef = bibleRef; }

    public List<OptionDTO> getOptions() { return options; }
    public void setOptions(List<OptionDTO> options) { this.options = options; }

    public Long getCreatedBy() { return createdBy; }
    public void setCreatedBy(Long createdBy) { this.createdBy = createdBy; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
}
