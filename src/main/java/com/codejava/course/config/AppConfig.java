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
        if(!roleRepository.existsRoleByName("ROLE_FARMER"))
            roleRepository.save(Role.builder().id(2L).name("ROLE_FARMER").build());
        if(!roleRepository.existsRoleByName("ROLE_ENTERPRISE"))
            roleRepository.save(Role.builder().id(3L).name("ROLE_ENTERPRISE").build());

        Role adminRole = roleRepository.findById(1L).get();
        Role farmerRole = roleRepository.findById(2L).get();
        if(!userRepository.existsByUsername("admin")) {
            userRepository.save(
                    User.builder()
                            .name("Admin")
                            .username("admin")
                            .password(passwordEncoder.encode("admin"))
                            .role(adminRole)
                            .build());
        }
        if(!userRepository.existsByUsername("farmer")) {
            userRepository.save(
                    User.builder()
                            .name("Farmer")
                            .username("farmer")
                            .password(passwordEncoder.encode("farmer"))
                            .role(farmerRole)
                            .build());
        }
    }
}
