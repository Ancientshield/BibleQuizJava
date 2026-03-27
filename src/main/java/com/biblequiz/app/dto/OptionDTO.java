package com.biblequiz.app.dto;

/** 選項 DTO — 每個選項帶 id、content、isCorrect，前端用來本地驗答。 */
public class OptionDTO {
    private Integer id;
    private String content;
    private boolean isCorrect;

    // ── Getters and Setters ──
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public boolean isCorrect() { return isCorrect; }
    public void setCorrect(boolean correct) { isCorrect = correct; }
}
