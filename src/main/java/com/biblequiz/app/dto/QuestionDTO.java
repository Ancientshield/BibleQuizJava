package com.biblequiz.app.dto;

import java.util.List;

/**
 * 題目 DTO — 回傳給前端的題目資料。
 * 新版直接帶 isCorrect，前端本地驗答，零延遲。
 */
public class QuestionDTO {
    private Integer id;
    private String content;
    private List<OptionDTO> options;

    // ── Getters and Setters ──
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public List<OptionDTO> getOptions() { return options; }
    public void setOptions(List<OptionDTO> options) { this.options = options; }

    /**
     * 選項 DTO — 作為 QuestionDTO 的 static inner class。
     */
    public static class OptionDTO {
        private Integer id;
        private String content;
        private boolean isCorrect;

        // ── Getters and Setters ──
        public Integer getId() { return id; }
        public void setId(Integer id) { this.id = id; }

        public String getContent() { return content; }
        public void setContent(String content) { this.content = content; }

        public boolean getIsCorrect() { return isCorrect; }
        public void setIsCorrect(boolean isCorrect) { this.isCorrect = isCorrect; }
    }
}
