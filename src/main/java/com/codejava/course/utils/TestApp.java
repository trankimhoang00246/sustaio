package com.codejava.course.utils;

import com.auth0.jwt.algorithms.Algorithm;

public class TestApp {
    public static void main(String[] args) {
        System.out.println(Algorithm.HMAC512("Hoang"));
    }
}
