package com.biblequiz.app.dto;

import java.util.List;

/** 編輯題目 Request — 結構同 QuestionCreateRequest，語意上區分新增和編輯。 */
public class QuestionUpdateRequest {

    private String content;
    private List<OptionRequest> options;

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
}
