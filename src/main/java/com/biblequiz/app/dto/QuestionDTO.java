package com.biblequiz.app.dto;

/**
 * 題目 DTO — 回傳給前端的題目資料。
 * 刻意不含 correctAnswer，防止前端看到答案。
 */
public class QuestionDTO {
    private Integer id;
    private String content;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    // 注意：刻意不放 correctAnswer，防止洩漏給前端

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
}
