package com.biblequiz.app.service;

import com.biblequiz.app.dto.AuthRequest;
import com.biblequiz.app.dto.AuthResponse;
import com.biblequiz.app.entity.AppUser;
import com.biblequiz.app.entity.AuthProvider;
import com.biblequiz.app.repository.AppUserRepository;
import com.biblequiz.app.security.JwtTokenProvider;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class AuthService {

    private final AppUserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenProvider jwtTokenProvider;

    public AuthService(AppUserRepository userRepository,
                       PasswordEncoder passwordEncoder,
                       JwtTokenProvider jwtTokenProvider) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtTokenProvider = jwtTokenProvider;
    }

    /** 註冊：建立新帳號，回��� JWT */
    public AuthResponse register(AuthRequest request) {
        // 驗證 email 格式
        if (request.getEmail() == null || !request.getEmail().matches("^[\\w.+-]+@[\\w-]+\\.[\\w.]+$")) {
            throw new IllegalArgumentException("Email 格式不正確");
        }

        // 驗證密碼長度
        if (request.getPassword() == null || request.getPassword().length() < 8) {
            throw new IllegalArgumentException("密碼長度至少 8 個字元");
        }

        // 驗證 email 不重複
        if (userRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new IllegalArgumentException("此 Email 已被註冊");
        }

        // 建立新使用者
        AppUser user = new AppUser();
        user.setEmail(request.getEmail());
        user.setName(request.getName());
        user.setPasswordHash(passwordEncoder.encode(request.getPassword()));
        user.setProvider(AuthProvider.LOCAL);
        user.setLastLoginAt(LocalDateTime.now());

        userRepository.save(user);

        // 產生 JWT
        String token = jwtTokenProvider.generateToken(
                user.getId(), user.getEmail(), user.getRole().name());

        return new AuthResponse(token, user.getId(), user.getEmail(),
                user.getName(), user.getRole().name());
    }

    /** 登入：比對密碼��回傳 JWT */
    public AuthResponse login(AuthRequest request) {
        AppUser user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new IllegalArgumentException("帳號或密碼錯誤"));

        // 只有 LOCAL 使用者可以用密碼���入
        if (user.getProvider() != AuthProvider.LOCAL) {
            throw new IllegalArgumentException("此帳號請使用 " + user.getProvider() + " 登入");
        }

        // 比對密碼
        if (!passwordEncoder.matches(request.getPassword(), user.getPasswordHash())) {
            throw new IllegalArgumentException("帳號或密碼錯誤");
        }

        // 更新最後登入時間
        user.setLastLoginAt(LocalDateTime.now());
        userRepository.save(user);

        // 產生 JWT
        String token = jwtTokenProvider.generateToken(
                user.getId(), user.getEmail(), user.getRole().name());

        return new AuthResponse(token, user.getId(), user.getEmail(),
                user.getName(), user.getRole().name());
    }

    /** 取得使用者資訊（根據 JWT 裡的 userId） */
    public AuthResponse getUserInfo(Long userId) {
        AppUser user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("���用者不存在"));

        return new AuthResponse(null, user.getId(), user.getEmail(),
                user.getName(), user.getRole().name());
    }
}
