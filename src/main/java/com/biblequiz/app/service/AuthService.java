package com.biblequiz.app.service;

import com.biblequiz.app.dto.AuthRequest;
import com.biblequiz.app.dto.AuthResponse;
import com.biblequiz.app.entity.AppUser;
import com.biblequiz.app.entity.AuthProvider;
import com.biblequiz.app.entity.AuthToken;
import com.biblequiz.app.entity.AuthTokenType;
import com.biblequiz.app.repository.AppUserRepository;
import com.biblequiz.app.repository.AuthTokenRepository;
import com.biblequiz.app.security.JwtTokenProvider;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
public class AuthService {

    private final AppUserRepository userRepository;
    private final AuthTokenRepository authTokenRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenProvider jwtTokenProvider;
    private final EmailService emailService;

    public AuthService(AppUserRepository userRepository,
                       AuthTokenRepository authTokenRepository,
                       PasswordEncoder passwordEncoder,
                       JwtTokenProvider jwtTokenProvider,
                       EmailService emailService) {
        this.userRepository = userRepository;
        this.authTokenRepository = authTokenRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtTokenProvider = jwtTokenProvider;
        this.emailService = emailService;
    }

    /** 註冊：建立新帳號，發送驗證信（不直接回 JWT，要先驗證 email） */
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

        // 建立新使用者（emailVerified 預設 false）
        AppUser user = new AppUser();
        user.setEmail(request.getEmail());
        user.setPasswordHash(passwordEncoder.encode(request.getPassword()));
        user.setProvider(AuthProvider.LOCAL);

        userRepository.save(user);

        // 產生驗證 token 並寄出驗證信
        sendVerificationToken(user);

        // 註冊成功但尚未驗證，不回 JWT
        return new AuthResponse(null, user.getId(), user.getEmail(),
                user.getName(), user.getRole().name(), user.getAvatarUrl());
    }

    /** 產生驗證 token 並寄出驗證信 */
    private void sendVerificationToken(AppUser user) {
        AuthToken authToken = new AuthToken();
        authToken.setUser(user);
        authToken.setToken(UUID.randomUUID().toString());
        authToken.setType(AuthTokenType.VERIFY_EMAIL);
        authToken.setExpiresAt(LocalDateTime.now().plusHours(24));

        authTokenRepository.save(authToken);
        emailService.sendVerificationEmail(user.getEmail(), authToken.getToken());
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

        // 檢查 email 是否已驗證
        if (!user.getEmailVerified()) {
            throw new IllegalArgumentException("此帳號尚未驗證 Email，請查收信箱或重寄驗證信");
        }

        // 更新最後登入時間
        user.setLastLoginAt(LocalDateTime.now());
        userRepository.save(user);

        // 產生 JWT
        String token = jwtTokenProvider.generateToken(
                user.getId(), user.getEmail(), user.getRole().name());

        return new AuthResponse(token, user.getId(), user.getEmail(),
                user.getName(), user.getRole().name(), user.getAvatarUrl());
    }

    /** 驗證 Email：用 token 查找，檢查有效性，標記帳號為已驗證 */
    @Transactional
    public void verifyEmail(String token) {
        AuthToken authToken = authTokenRepository.findByToken(token)
                .orElseThrow(() -> new IllegalArgumentException("驗證連結無效"));

        if (authToken.getType() != AuthTokenType.VERIFY_EMAIL) {
            throw new IllegalArgumentException("驗證連結無效");
        }

        if (authToken.getUsedAt() != null) {
            throw new IllegalArgumentException("此連結已使用過");
        }

        if (authToken.getExpiresAt().isBefore(LocalDateTime.now())) {
            throw new IllegalArgumentException("驗證連結已過期，請重新註冊或要求重寄驗證信");
        }

        // 標記 token 為已使用
        authToken.setUsedAt(LocalDateTime.now());
        authTokenRepository.save(authToken);

        // 標記使用者 email 為已驗證
        AppUser user = authToken.getUser();
        user.setEmailVerified(true);
        userRepository.save(user);
    }

    /** 重寄驗證信（冷卻時間 60 秒） */
    public void resendVerificationEmail(String email) {
        AppUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("此 Email 尚未註冊"));

        if (user.getEmailVerified()) {
            throw new IllegalArgumentException("此帳號已驗證，可以直接登入");
        }

        // 冷卻時間檢查：最近 60 秒內有沒有寄過
        authTokenRepository.findFirstByUserIdAndTypeOrderByCreatedAtDesc(
                user.getId(), AuthTokenType.VERIFY_EMAIL
        ).ifPresent(lastToken -> {
            if (lastToken.getCreatedAt().plusSeconds(60).isAfter(LocalDateTime.now())) {
                throw new IllegalArgumentException("請稍候再重寄，每 60 秒只能寄一次");
            }
        });

        sendVerificationToken(user);
    }

    /** 忘記密碼：寄出密碼重設信（冷卻 60 秒） */
    public void forgotPassword(String email) {
        AppUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("此 Email 尚未註冊"));

        // 只有 LOCAL 使用者才有密碼可以重設
        if (user.getProvider() != AuthProvider.LOCAL) {
            throw new IllegalArgumentException("此帳號請使用 " + user.getProvider() + " 登入，無需密碼");
        }

        // 冷卻時間檢查
        authTokenRepository.findFirstByUserIdAndTypeOrderByCreatedAtDesc(
                user.getId(), AuthTokenType.RESET_PASSWORD
        ).ifPresent(lastToken -> {
            if (lastToken.getCreatedAt().plusSeconds(60).isAfter(LocalDateTime.now())) {
                throw new IllegalArgumentException("請稍候再試，每 60 秒只能寄一次");
            }
        });

        AuthToken authToken = new AuthToken();
        authToken.setUser(user);
        authToken.setToken(UUID.randomUUID().toString());
        authToken.setType(AuthTokenType.RESET_PASSWORD);
        authToken.setExpiresAt(LocalDateTime.now().plusHours(1));

        authTokenRepository.save(authToken);
        emailService.sendPasswordResetEmail(user.getEmail(), authToken.getToken());
    }

    /** 忘記密碼：用 token 驗證並設定新密碼 */
    public void resetPassword(String token, String newPassword) {
        if (newPassword == null || newPassword.length() < 8) {
            throw new IllegalArgumentException("密碼長度至少 8 個字元");
        }

        AuthToken authToken = authTokenRepository.findByToken(token)
                .orElseThrow(() -> new IllegalArgumentException("重設連結無效"));

        if (authToken.getType() != AuthTokenType.RESET_PASSWORD) {
            throw new IllegalArgumentException("重設連結無效");
        }

        if (authToken.getUsedAt() != null) {
            throw new IllegalArgumentException("此連結已使用過");
        }

        if (authToken.getExpiresAt().isBefore(LocalDateTime.now())) {
            throw new IllegalArgumentException("重設連結已過期，請重新申請");
        }

        // 標記 token 已使用
        authToken.setUsedAt(LocalDateTime.now());
        authTokenRepository.save(authToken);

        // 更新密碼
        AppUser user = authToken.getUser();
        user.setPasswordHash(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }

    /** 取得使用者資訊（根據 JWT 裡的 userId） */
    public AuthResponse getUserInfo(Long userId) {
        AppUser user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("使用者不存在"));

        return new AuthResponse(null, user.getId(), user.getEmail(),
                user.getName(), user.getRole().name(), user.getAvatarUrl());
    }
}
