package com.biblequiz.app.controller;

import com.biblequiz.app.dto.AuthRequest;
import com.biblequiz.app.dto.AuthResponse;
import com.biblequiz.app.service.AuthService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Tag(name = "認證", description = "Email 註冊、登入、登出、取得使用者資訊")
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @Operation(summary = "Email 註冊", description = "傳入 email + password，回傳 JWT token + 使用者資訊")
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest request) {
        try {
            AuthResponse response = authService.register(request);
            return ResponseEntity.ok(response);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @Operation(summary = "Email 登入", description = "傳入 email + password，回傳 JWT token + 使用者資訊")
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest request) {
        try {
            AuthResponse response = authService.login(request);
            return ResponseEntity.ok(response);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        }
    }

    @Operation(summary = "取得當前使用者資訊", description = "需在 header 帶 Authorization: Bearer {token}")
    @GetMapping("/me")
    public ResponseEntity<?> me() {
        var authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || authentication.getPrincipal() == null) {
            return ResponseEntity.status(401).body(Map.of("error", "未登入"));
        }

        Long userId = (Long) authentication.getPrincipal();
        AuthResponse response = authService.getUserInfo(userId);
        return ResponseEntity.ok(response);
    }

    @Operation(summary = "登出", description = "後端無狀態，前端清除 localStorage 的 token 即可")
    @PostMapping("/logout")
    public ResponseEntity<?> logout() {
        return ResponseEntity.ok(Map.of("message", "登出成功，請清除本地 token"));
    }
}
