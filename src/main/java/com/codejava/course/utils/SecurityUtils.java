package com.codejava.course.utils;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtils {
    public static String getUsernameOfPrincipal() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(auth != null)
            return auth.getName();
        return "anonymousUser";
    }
}
