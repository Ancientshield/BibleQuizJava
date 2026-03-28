package com.biblequiz.app.dto;

/** 登入 / 註冊成功後回傳的 DTO，包含 JWT token 和使用者基本資訊。 */
public class AuthResponse {

    private String token;
    private Long id;
    private String email;
    private String name;
    private String role;

    public AuthResponse(String token, Long id, String email, String name, String role) {
        this.token = token;
        this.id = id;
        this.email = email;
        this.name = name;
        this.role = role;
    }

    // ── Getters ──
    public String getToken() { return token; }
    public Long getId() { return id; }
    public String getEmail() { return email; }
    public String getName() { return name; }
    public String getRole() { return role; }
}
