package com.biblequiz.app.security;

import com.biblequiz.app.entity.Role;
import com.biblequiz.app.entity.User;
import com.biblequiz.app.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * Google OAuth2 登入成功後的處理器。
 * 1. 查找或建立 User（首次登入自動建帳號）
 * 2. 發行 JWT token
 * 3. 重導到前端，帶上 token 作為 query parameter
 */
@Component
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

    private final UserRepository userRepository;
    private final JwtTokenProvider jwtTokenProvider;

    public OAuth2LoginSuccessHandler(UserRepository userRepository, JwtTokenProvider jwtTokenProvider) {
        this.userRepository = userRepository;
        this.jwtTokenProvider = jwtTokenProvider;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException {
        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();

        String email = oAuth2User.getAttribute("email");
        String name = oAuth2User.getAttribute("name");
        String providerId = oAuth2User.getAttribute("sub"); // Google 的唯一 ID

        // 查找或建立使用者
        User user = userRepository.findByEmail(email).orElseGet(() -> {
            User newUser = new User();
            newUser.setEmail(email);
            newUser.setName(name);
            newUser.setProvider("google");
            newUser.setProviderId(providerId);
            newUser.setRole(Role.USER);
            return userRepository.save(newUser);
        });

        // 更新名稱（Google 使用者可能改名）
        if (name != null && !name.equals(user.getName())) {
            user.setName(name);
            userRepository.save(user);
        }

        // 發行 JWT
        String token = jwtTokenProvider.generateToken(user.getId(), user.getEmail(), user.getRole().name());

        // 重導到前端，前端從 URL 取出 token 存入 localStorage
        response.sendRedirect("/?token=" + token);
    }
}
