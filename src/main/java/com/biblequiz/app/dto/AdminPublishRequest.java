package com.biblequiz.app.dto;

/** 管理者核准上架 Request — 必須指定分類和經文出處。 */
public class AdminPublishRequest {

    private Short categoryId;
    private Short bibleBookId;
    private Short bibleChapter;
    private Short bibleVerseStart;
    private Short bibleVerseEnd;

    // ── Getters and Setters ──
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
