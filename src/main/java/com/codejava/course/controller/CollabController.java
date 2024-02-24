package com.codejava.course.controller;

import com.codejava.course.service.CollabService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/collab")
@RequiredArgsConstructor
public class CollabController {
    private final CollabService collabService;

    @GetMapping
    public ResponseEntity getAll() {
        return ResponseEntity.ok(collabService.getAllCollabs());
    }

    @GetMapping("/{id}")
    public ResponseEntity getById(@PathVariable("id") long id) {
        return ResponseEntity.ok(collabService.getCollabById(id));
    }

    @GetMapping("/category/{categoryId}")
    public ResponseEntity getByCategoryId(@PathVariable("categoryId") long categoryId) {
        return ResponseEntity.ok(collabService.getAllCollabsByCategoryId(categoryId));
    }
}
