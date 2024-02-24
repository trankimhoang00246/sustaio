package com.codejava.course.repository;

import com.codejava.course.model.entity.CollabRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CollabRequestRepository extends JpaRepository<CollabRequest, Long> {
    List<CollabRequest> findAllByUser_Username(String username);
}
