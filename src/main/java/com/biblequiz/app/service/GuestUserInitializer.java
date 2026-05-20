package com.biblequiz.app.service;

import com.biblequiz.app.entity.AppUser;
import com.biblequiz.app.entity.AuthProvider;
import com.biblequiz.app.entity.Role;
import com.biblequiz.app.repository.AppUserRepository;
import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 匿名作答 sentinel 使用者初始化。
 * 啟動時確保 guest@biblequiz.local 帳號存在,把它的 id cache 起來給 GuestQuizController 用。
 * 這樣不需要動 quiz_round.user_id NOT NULL 的 schema,所有匿名 round 都掛在這個帳號下。
 */
@Component
public class GuestUserInitializer {

    public static final String GUEST_EMAIL = "guest@biblequiz.local";

    private final AppUserRepository appUserRepository;
    private Long guestUserId;

    public GuestUserInitializer(AppUserRepository appUserRepository) {
        this.appUserRepository = appUserRepository;
    }

    @PostConstruct
    @Transactional
    public void init() {
        AppUser guest = appUserRepository.findByEmail(GUEST_EMAIL).orElseGet(() -> {
            AppUser user = new AppUser();
            user.setEmail(GUEST_EMAIL);
            user.setName("匿名訪客");
            user.setProvider(AuthProvider.GUEST);
            user.setRole(Role.USER);
            user.setEmailVerified(false);
            return appUserRepository.save(user);
        });
        this.guestUserId = guest.getId();
    }

    public Long getGuestUserId() {
        return guestUserId;
    }
}
