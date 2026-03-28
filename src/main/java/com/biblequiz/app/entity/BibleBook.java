package com.biblequiz.app.entity;

import jakarta.persistence.*;

/** 聖經書卷 Entity — 對應 bible_book 資料表（66 卷 lookup table）。 */
@Entity
@Table(name = "bible_book")
public class BibleBook {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    @Column(length = 20, nullable = false, unique = true)
    private String name;

    @Column(length = 2, nullable = false)
    private String testament;

    @Column(name = "sort_order", nullable = false, unique = true)
    private Short sortOrder;

    // ── Getters and Setters ──
    public Short getId() { return id; }
    public void setId(Short id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getTestament() { return testament; }
    public void setTestament(String testament) { this.testament = testament; }

    public Short getSortOrder() { return sortOrder; }
    public void setSortOrder(Short sortOrder) { this.sortOrder = sortOrder; }
}
