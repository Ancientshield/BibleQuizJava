package com.biblequiz.app.entity;

import jakarta.persistence.*;
import java.util.List;

/** 題目 Entity — 對應 question 資料表。 */
@Entity
@Table(name = "question")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String content;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private QuestionCategory category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bible_book_id")
    private BibleBook bibleBook;

    @Column(name = "bible_chapter")
    private Short bibleChapter;

    @Column(name = "bible_verse_start")
    private Short bibleVerseStart;

    @Column(name = "bible_verse_end")
    private Short bibleVerseEnd;

    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL)
    private List<QuestionOption> options;

    // ── Getters and Setters ──
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public QuestionCategory getCategory() { return category; }
    public void setCategory(QuestionCategory category) { this.category = category; }

    public BibleBook getBibleBook() { return bibleBook; }
    public void setBibleBook(BibleBook bibleBook) { this.bibleBook = bibleBook; }

    public Short getBibleChapter() { return bibleChapter; }
    public void setBibleChapter(Short bibleChapter) { this.bibleChapter = bibleChapter; }

    public Short getBibleVerseStart() { return bibleVerseStart; }
    public void setBibleVerseStart(Short bibleVerseStart) { this.bibleVerseStart = bibleVerseStart; }

    public Short getBibleVerseEnd() { return bibleVerseEnd; }
    public void setBibleVerseEnd(Short bibleVerseEnd) { this.bibleVerseEnd = bibleVerseEnd; }

    public List<QuestionOption> getOptions() { return options; }
    public void setOptions(List<QuestionOption> options) { this.options = options; }
}
