package com.codejava.course.model.form;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

@Data
public class RegisterForm {
    @NotEmpty(message = "Username is required")
    @Min(value = 5, message = "Username must be at least 5 characters long")
    private String username;
    @NotEmpty(message = "Password is required")
    @Min(value = 5, message = "Username must be at least 5 characters long")
    private String password;
    @NotEmpty(message = "Name is required")
    @Min(value = 3, message = "Username must be at least 3 characters long")
    private String name;
}
