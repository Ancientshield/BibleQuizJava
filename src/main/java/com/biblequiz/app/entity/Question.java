package com.biblequiz.app.entity;

import jakarta.persistence.*;

/**
 * 題目 Entity — 對應 question 資料表。
 * 一個 Entity 類別 = 一張表，一個物件 = 一筆資料列。
 */
@Entity
@Table(name = "question")
public class Question {

    @Id // 主鍵
    @GeneratedValue(strategy = GenerationType.IDENTITY) // 資料庫自動遞增
    private Integer id;

    @Column(columnDefinition = "TEXT") // 不限長度，預設 VARCHAR(255) 會不夠
    private String content;

    // 四個選項，@Column 明確對應 snake_case 欄位名
    @Column(name = "option_a")
    private String optionA;

    @Column(name = "option_b")
    private String optionB;

    @Column(name = "option_c")
    private String optionC;

    @Column(name = "option_d")
    private String optionD;

    @Column(name = "correct_answer", length = 1) // 單一字母 A/B/C/D，不出現在 DTO 裡
    private String correctAnswer;

    // ── Getters and Setters ──
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getOptionA() { return optionA; }
    public void setOptionA(String optionA) { this.optionA = optionA; }

    public String getOptionB() { return optionB; }
    public void setOptionB(String optionB) { this.optionB = optionB; }

    public String getOptionC() { return optionC; }
    public void setOptionC(String optionC) { this.optionC = optionC; }

    public String getOptionD() { return optionD; }
    public void setOptionD(String optionD) { this.optionD = optionD; }

    public String getCorrectAnswer() { return correctAnswer; }
    public void setCorrectAnswer(String correctAnswer) { this.correctAnswer = correctAnswer; }
}

