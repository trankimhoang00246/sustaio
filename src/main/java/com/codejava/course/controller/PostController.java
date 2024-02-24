package com.codejava.course.controller;

import com.codejava.course.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/post")
public class PostController {
    private final PostService postService;

    @GetMapping
    public ResponseEntity getAll() {
        return ResponseEntity.ok(postService.getAll());
    }

    @GetMapping("/category")
    public ResponseEntity getAllByCategoryName(@RequestParam("name") String name) {
        return ResponseEntity.ok(postService.getAllByCategoryName(name));
    }

    @GetMapping("/{id}")
    public ResponseEntity getById(@PathVariable("id") Long id) {
        return ResponseEntity.ok(postService.getById(id));
    }

    @GetMapping("/newest")
    public ResponseEntity get5NewestPosts() {
        return ResponseEntity.ok(postService.get5NewestPosts());
    }
}
