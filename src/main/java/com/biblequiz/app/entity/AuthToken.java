package com.biblequiz.app.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

/**
 * 一次性驗證 Token Entity — 對應 auth_token 資料表。
 * 用途：email 驗證（VERIFY_EMAIL）、密碼重設（RESET_PASSWORD）。
 * Token 使用 UUID v4 產生，用完後 usedAt 會被設值，不會被二次使用。
 */
@Entity
@Table(name = "auth_token")
public class AuthToken {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** 此 token 屬於哪個使用者 */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private AppUser user;

    /** UUID v4 字串，放在驗證連結的 query parameter 裡 */
    @Column(nullable = false, unique = true)
    private String token;

    /** Token 類型：VERIFY_EMAIL 或 RESET_PASSWORD */
    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private AuthTokenType type;

    /** 過期時間（驗證信 24 小時，重設密碼 1 小時） */
    @Column(name = "expires_at", nullable = false)
    private LocalDateTime expiresAt;

    /** 使用時間（null = 尚未使用） */
    @Column(name = "used_at")
    private LocalDateTime usedAt;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }

    // ── Getters and Setters ──
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public AppUser getUser() { return user; }
    public void setUser(AppUser user) { this.user = user; }

    public String getToken() { return token; }
    public void setToken(String token) { this.token = token; }

    public AuthTokenType getType() { return type; }
    public void setType(AuthTokenType type) { this.type = type; }

    public LocalDateTime getExpiresAt() { return expiresAt; }
    public void setExpiresAt(LocalDateTime expiresAt) { this.expiresAt = expiresAt; }

    public LocalDateTime getUsedAt() { return usedAt; }
    public void setUsedAt(LocalDateTime usedAt) { this.usedAt = usedAt; }

    public LocalDateTime getCreatedAt() { return createdAt; }
}
