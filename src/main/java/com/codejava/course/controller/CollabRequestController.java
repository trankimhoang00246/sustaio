package com.codejava.course.controller;

import com.codejava.course.model.form.CollabRequestForm;
import com.codejava.course.service.CollabRequestService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/collab-requests")
public class CollabRequestController {
    private final CollabRequestService collabRequestService;

    @GetMapping
    public ResponseEntity getMyCollabRequests() {
        return ResponseEntity.ok(collabRequestService.getMyCollabRequests());
    }

    @GetMapping("/{id}")
    public ResponseEntity getCollabRequestById(@PathVariable("id") long id) {
        return ResponseEntity.ok(collabRequestService.getCollabRequestById(id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deleteCollabRequest(@PathVariable("id") long id) {
        return ResponseEntity.ok(collabRequestService.deleteCollabRequest(id));
    }

    @PostMapping
    public ResponseEntity createCollabRequest(@Valid @RequestBody  CollabRequestForm collabRequestForm) {
        return ResponseEntity.ok(collabRequestService.createCollabRequest(collabRequestForm));
    }

    @PatchMapping("/{id}")
    public ResponseEntity updateStatusCollabRequest(@PathVariable("id") long id, @RequestParam("status") String status) {
        return ResponseEntity.ok(collabRequestService.updateStatusCollabRequest(status, id));
    }
}
