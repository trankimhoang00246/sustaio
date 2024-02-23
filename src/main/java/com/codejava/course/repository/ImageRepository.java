package com.codejava.course.repository;

import com.codejava.course.model.entity.Image;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ImageRepository extends JpaRepository<Image, UUID> {
    boolean existsImageById(UUID id);
}
