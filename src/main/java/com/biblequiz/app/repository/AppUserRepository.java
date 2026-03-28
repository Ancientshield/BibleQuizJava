package com.biblequiz.app.repository;

import com.biblequiz.app.entity.AppUser;
import com.biblequiz.app.entity.AuthProvider;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AppUserRepository extends JpaRepository<AppUser, Long> {

    Optional<AppUser> findByEmail(String email);

    Optional<AppUser> findByProviderAndProviderId(AuthProvider provider, String providerId);
}
