package com.biblequiz.app.security;

import com.biblequiz.app.entity.AppUser;
import com.biblequiz.app.entity.AuthProvider;
import com.biblequiz.app.repository.AppUserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;

/**
 * OAuth2 登入成功後的處理器 — 四家 OAuth 共用。
 *
 * 流程：
 * 1. 從 OAuth2User 取出 email、name、avatar、provider、providerId
 * 2. 查 DB：有帳號 → 更新 lastLoginAt；沒帳號 → 建新帳號
 * 3. 產生 JWT，redirect 回前端並帶上 token
 */
@Component
public class OAuth2SuccessHandler implements AuthenticationSuccessHandler {

    private final AppUserRepository userRepository;
    private final JwtTokenProvider jwtTokenProvider;

    public OAuth2SuccessHandler(AppUserRepository userRepository,
                                JwtTokenProvider jwtTokenProvider) {
        this.userRepository = userRepository;
        this.jwtTokenProvider = jwtTokenProvider;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException {

        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();

        // 從 OAuth2 回傳的資料取出使用者資訊
        String registrationId = request.getRequestURI()
                .replaceAll(".*/login/oauth2/code/", "");
        AuthProvider provider = AuthProvider.valueOf(registrationId.toUpperCase());

        // 根據 provider 取出對應的 attribute key
        final String userProviderId;
        final String userEmail;
        final String userName;
        final String userAvatar;

        if (provider == AuthProvider.X) {
            // X 的 user info 回傳格式：{ data: { id: "...", name: "...", username: "..." } }
            @SuppressWarnings("unchecked")
            Map<String, Object> data = oAuth2User.getAttribute("data");
            userProviderId = data != null ? String.valueOf(data.get("id")) : null;
            userEmail = null;  // X 不回傳 email
            userName = data != null ? (String) data.get("name") : null;
            userAvatar = null;  // X user info API 不回傳頭像
        } else if (provider == AuthProvider.LINE) {
            userProviderId = oAuth2User.getAttribute("userId");
            userEmail = oAuth2User.getAttribute("email");
            userName = oAuth2User.getAttribute("displayName");
            userAvatar = oAuth2User.getAttribute("pictureUrl");
        } else if (provider == AuthProvider.GITHUB) {
            // GitHub 回傳：id (Integer), login (username), name, email, avatar_url
            userProviderId = String.valueOf(oAuth2User.getAttribute("id"));
            userEmail = oAuth2User.getAttribute("email");
            String ghName = oAuth2User.getAttribute("name");
            userName = ghName != null ? ghName : oAuth2User.getAttribute("login");
            userAvatar = oAuth2User.getAttribute("avatar_url");
        } else {
            // Google 用 "sub"
            userProviderId = oAuth2User.getAttribute("sub");
            userEmail = oAuth2User.getAttribute("email");
            userName = oAuth2User.getAttribute("name");
            userAvatar = oAuth2User.getAttribute("picture");
        }

        // LINE 的 profile API 不回傳 email（除非用 OpenID Connect），用 providerId 生成佔位 email
        final String emailToSave = (userEmail != null) ? userEmail
                : userProviderId + "@" + provider.name().toLowerCase() + ".oauth";

        // 查 DB：有帳號就更新，沒有就建新的
        AppUser user = userRepository.findByProviderAndProviderId(provider, userProviderId)
                .orElseGet(() -> {
                    AppUser newUser = new AppUser();
                    newUser.setEmail(emailToSave);
                    newUser.setProvider(provider);
                    newUser.setProviderId(userProviderId);
                    newUser.setEmailVerified(true);  // OAuth 帳號視為已驗證
                    return newUser;
                });

        // 更新可能變動的資訊
        user.setName(userName);
        user.setAvatarUrl(userAvatar);
        user.setLastLoginAt(LocalDateTime.now());
        userRepository.save(user);

        // 產生 JWT
        String token = jwtTokenProvider.generateToken(
                user.getId(), user.getEmail(), user.getRole().name());

        // redirect 回前端，帶上 token（前端從 URL 取出存到 localStorage）
        response.sendRedirect("http://localhost:3000/oauth/callback?token=" + token);
    }
}
