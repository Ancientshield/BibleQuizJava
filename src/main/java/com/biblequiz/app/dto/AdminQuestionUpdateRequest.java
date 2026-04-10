package com.biblequiz.app.dto;

import java.util.List;

/** 管理者編輯題目 Request — 除了內容和選項，還能修改分類和經文出處。 */
public class AdminQuestionUpdateRequest {

    private String content;
    private List<OptionRequest> options;
    private Short categoryId;
    private Short bibleBookId;
    private Short bibleChapter;
    private Short bibleVerseStart;
    private Short bibleVerseEnd;

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

    public Short getCategoryId() { return categoryId; }
    public void setCategoryId(Short categoryId) { this.categoryId = categoryId; }

    public Short getBibleBookId() { return bibleBookId; }
    public void setBibleBookId(Short bibleBookId) { this.bibleBookId = bibleBookId; }

    public Short getBibleChapter() { return bibleChapter; }
    public void setBibleChapter(Short bibleChapter) { this.bibleChapter = bibleChapter; }

    public Short getBibleVerseStart() { return bibleVerseStart; }
    public void setBibleVerseStart(Short bibleVerseStart) { this.bibleVerseStart = bibleVerseStart; }

    public Short getBibleVerseEnd() { return bibleVerseEnd; }
    public void setBibleVerseEnd(Short bibleVerseEnd) { this.bibleVerseEnd = bibleVerseEnd; }
}
