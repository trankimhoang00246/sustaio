package com.codejava.course.service;

import com.codejava.course.model.dto.AuthDto;
import com.codejava.course.model.form.LoginForm;
import com.codejava.course.model.form.RegisterForm;

public interface AuthService {
    AuthDto login(LoginForm form);
    String register(RegisterForm form);
    AuthDto refreshJWT(String refreshToken);
}
