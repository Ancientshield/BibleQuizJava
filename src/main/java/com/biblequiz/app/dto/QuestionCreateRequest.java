package com.biblequiz.app.dto;

import java.util.List;

/** 新增題目 Request — 投稿人填題目 + 選項，分類和經文出處由管理者審核時指定。 */
public class QuestionCreateRequest {

    private String content;
    private List<OptionRequest> options;
    private String explanation;
    private Short categoryId;
    private String suggestedCategory;

    public static class OptionRequest {
        private String content;
        private boolean correct;

        public String getContent() { return content; }
        public void setContent(String content) { this.content = content; }

        public boolean isCorrect() { return correct; }
        public void setCorrect(boolean correct) { this.correct = correct; }
    }

    // ── Getters and Setters ──
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public List<OptionRequest> getOptions() { return options; }
    public void setOptions(List<OptionRequest> options) { this.options = options; }

    public String getExplanation() { return explanation; }
    public void setExplanation(String explanation) { this.explanation = explanation; }

    public Short getCategoryId() { return categoryId; }
    public void setCategoryId(Short categoryId) { this.categoryId = categoryId; }

    public String getSuggestedCategory() { return suggestedCategory; }
    public void setSuggestedCategory(String suggestedCategory) { this.suggestedCategory = suggestedCategory; }
}
