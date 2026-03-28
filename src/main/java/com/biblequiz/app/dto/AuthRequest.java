package com.biblequiz.app.dto;

/** 註冊 / 登入共用的請求 DTO。註冊時 name 必填，登入時 name 不需要。 */
public class AuthRequest {

    private String email;
    private String password;
    private String name;

    // ── Getters and Setters ──
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
