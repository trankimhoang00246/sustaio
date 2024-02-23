package com.codejava.course.config;

import com.codejava.course.model.entity.Role;
import com.codejava.course.model.entity.User;
import com.codejava.course.repository.RoleRepository;
import com.codejava.course.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@RequiredArgsConstructor
public class AppConfig {
    private final RoleRepository roleRepository;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Bean
    public void initApp() {
        if(!roleRepository.existsRoleByName("ROLE_ADMIN"))
            roleRepository.save(Role.builder().id(1L).name("ROLE_ADMIN").build());
        if(!roleRepository.existsRoleByName("ROLE_USER"))
            roleRepository.save(Role.builder().id(2L).name("ROLE_USER").build());

        Role adminRole = roleRepository.findById(1L).get();
        Role userRole = roleRepository.findById(2L).get();
        if(!userRepository.existsByUsername("admin")) {
            userRepository.save(
                    User.builder()
                            .name("Admin")
                            .username("admin")
                            .password(passwordEncoder.encode("admin"))
                            .role(adminRole)
                            .build());
        }
        if(!userRepository.existsByUsername("user")) {
            userRepository.save(
                    User.builder()
                            .name("User")
                            .username("user")
                            .password(passwordEncoder.encode("user"))
                            .role(userRole)
                            .build());
        }
    }
}
