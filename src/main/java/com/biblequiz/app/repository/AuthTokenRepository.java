package com.biblequiz.app.repository;

import com.biblequiz.app.entity.AuthToken;
import com.biblequiz.app.entity.AuthTokenType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AuthTokenRepository extends JpaRepository<AuthToken, Long> {

    /** 用 token 字串查詢（驗證連結、重設密碼連結用） */
    Optional<AuthToken> findByToken(String token);

    /** 找某使用者最新的某類型 token（用來做 resend 的冷卻時間檢查） */
    Optional<AuthToken> findFirstByUserIdAndTypeOrderByCreatedAtDesc(Long userId, AuthTokenType type);
}
