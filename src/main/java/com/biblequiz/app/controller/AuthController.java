package com.biblequiz.app.controller;

import com.biblequiz.app.entity.User;
import com.biblequiz.app.repository.UserRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 認證相關 API。
 * - GET /api/auth/me — 取得當前使用者資訊（從 JWT 解析的 userId 查 DB）
 * - POST /api/auth/logout — 前端清除 token（後端無狀態，不需處理）
 */
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final UserRepository userRepository;

    public AuthController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    /** 取得當前登入使用者資訊 */
    @GetMapping("/me")
    public ResponseEntity<?> getCurrentUser(Authentication authentication) {
        if (authentication == null) {
            return ResponseEntity.status(401).body(Map.of("error", "未登入"));
        }

        Long userId = (Long) authentication.getPrincipal();
        User user = userRepository.findById(userId).orElse(null);

        if (user == null) {
            return ResponseEntity.status(404).body(Map.of("error", "使用者不存在"));
        }

        return ResponseEntity.ok(Map.of(
                "id", user.getId(),
                "email", user.getEmail(),
                "name", user.getName() != null ? user.getName() : "",
                "role", user.getRole().name()
        ));
    }

    /** 登出（後端無狀態，回傳成功即可，前端自行清除 token） */
    @PostMapping("/logout")
    public ResponseEntity<?> logout() {
        return ResponseEntity.ok(Map.of("message", "已登出"));
    }
}
