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
    private Short categoryId;
    private String categoryName;
    private Short bibleBookId;
    private String bibleRef;
    private Short bibleChapter;
    private Short bibleVerseStart;
    private Short bibleVerseEnd;
    private List<OptionDTO> options;
    private Integer totalAnswered;
    private Integer correctCount;
    private Double accuracyRate;
    private String mostSelectedWrongOption;
    private Long createdBy;
    private String authorName;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // ── Getters and Setters ──
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Short getCategoryId() { return categoryId; }
    public void setCategoryId(Short categoryId) { this.categoryId = categoryId; }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public Short getBibleBookId() { return bibleBookId; }
    public void setBibleBookId(Short bibleBookId) { this.bibleBookId = bibleBookId; }

    public String getBibleRef() { return bibleRef; }
    public void setBibleRef(String bibleRef) { this.bibleRef = bibleRef; }

    public Short getBibleChapter() { return bibleChapter; }
    public void setBibleChapter(Short bibleChapter) { this.bibleChapter = bibleChapter; }

    public Short getBibleVerseStart() { return bibleVerseStart; }
    public void setBibleVerseStart(Short bibleVerseStart) { this.bibleVerseStart = bibleVerseStart; }

    public Short getBibleVerseEnd() { return bibleVerseEnd; }
    public void setBibleVerseEnd(Short bibleVerseEnd) { this.bibleVerseEnd = bibleVerseEnd; }

    public List<OptionDTO> getOptions() { return options; }
    public void setOptions(List<OptionDTO> options) { this.options = options; }

    public Integer getTotalAnswered() { return totalAnswered; }
    public void setTotalAnswered(Integer totalAnswered) { this.totalAnswered = totalAnswered; }

    public Integer getCorrectCount() { return correctCount; }
    public void setCorrectCount(Integer correctCount) { this.correctCount = correctCount; }

    public Double getAccuracyRate() { return accuracyRate; }
    public void setAccuracyRate(Double accuracyRate) { this.accuracyRate = accuracyRate; }

    public String getMostSelectedWrongOption() { return mostSelectedWrongOption; }
    public void setMostSelectedWrongOption(String mostSelectedWrongOption) { this.mostSelectedWrongOption = mostSelectedWrongOption; }

    public Long getCreatedBy() { return createdBy; }
    public void setCreatedBy(Long createdBy) { this.createdBy = createdBy; }

    public String getAuthorName() { return authorName; }
    public void setAuthorName(String authorName) { this.authorName = authorName; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
}
