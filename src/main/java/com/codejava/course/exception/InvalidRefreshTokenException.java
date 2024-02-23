package com.codejava.course.exception;

import lombok.Getter;

@Getter
public class InvalidRefreshTokenException extends RuntimeException{

    private final String refreshToken;

    public InvalidRefreshTokenException(String refreshToken) {
        super("Invalid refresh token");
        this.refreshToken = refreshToken;
    }
}
