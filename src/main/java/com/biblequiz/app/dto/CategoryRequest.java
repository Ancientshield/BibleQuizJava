package com.biblequiz.app.dto;

/**
 * 管理者新增 / 編輯分類用的 Request。
 *
 * POST：name 必填，sortOrder 選填（沒傳會自動設為目前最大值 + 1）
 * PATCH：name / sortOrder 擇一填即可，沒傳的欄位不動
 */
public class CategoryRequest {

    private String name;
    private Short sortOrder;

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Short getSortOrder() { return sortOrder; }
    public void setSortOrder(Short sortOrder) { this.sortOrder = sortOrder; }
}
