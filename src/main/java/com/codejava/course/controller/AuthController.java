package com.codejava.course.controller;

import com.codejava.course.model.dto.AuthDto;
import com.codejava.course.model.form.LoginForm;
import com.codejava.course.model.form.RegisterForm;
import com.codejava.course.service.AuthService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/v1/auth")
public class AuthController {
    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public AuthDto login(@RequestBody LoginForm form){
        return authService.login(form);
    }

    @PostMapping("/register")
    public String login(@RequestBody RegisterForm form){
        return authService.register(form);
    }

    @GetMapping("/refresh")
    public AuthDto refreshToken(@RequestHeader("X-Refresh-Token") String refreshToken){
        return authService.refreshJWT(refreshToken);
    }
}
