package com.biblequiz.app.dto;

import java.util.List;

/** 題目 DTO — 含 options 陣列（每個選項帶 isCorrect），前端本地驗答。 */
public class QuestionDTO {
    private Integer id;
    private String content;
    private String category;
    private String bibleRef;
    private List<OptionDTO> options;

    // ── Getters and Setters ──
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getBibleRef() { return bibleRef; }
    public void setBibleRef(String bibleRef) { this.bibleRef = bibleRef; }

    public List<OptionDTO> getOptions() { return options; }
    public void setOptions(List<OptionDTO> options) { this.options = options; }
}
