package com.biblequiz.app.dto;

/** 註冊 / 登入共用的請求 DTO。兩者都只需要 email + password。 */
public class AuthRequest {

    private String email;
    private String password;

    // ── Getters and Setters ──
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
