package com.codejava.course.model.dto;

import com.codejava.course.model.entity.User;
import lombok.Builder;
import lombok.Data;
import org.springframework.security.core.Authentication;

@Data
@Builder
public class AuthDto {
    private Long id;
    private String token;
    private String refreshToken;
    private String username;
    private String name;
    private String role;

    public static AuthDto from(User user, String token, String refreshToken){
        return AuthDto.builder()
                .id(user.getId())
                .name(user.getName())
                .username(user.getUsername())
                .role(user.getAuthorities().stream().findFirst().get().getAuthority())
                .token(token)
                .refreshToken(refreshToken)
                .build();
    }
}
