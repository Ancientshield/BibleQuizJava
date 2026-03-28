package com.biblequiz.app.entity;

import jakarta.persistence.*;

/** 題目分類 Entity — 對應 question_category 資料表（8 類 lookup table）。 */
@Entity
@Table(name = "question_category")
public class QuestionCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    @Column(length = 20, nullable = false, unique = true)
    private String name;

    @Column(name = "sort_order", nullable = false, unique = true)
    private Short sortOrder;

    // ── Getters and Setters ──
    public Short getId() { return id; }
    public void setId(Short id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Short getSortOrder() { return sortOrder; }
    public void setSortOrder(Short sortOrder) { this.sortOrder = sortOrder; }
}
