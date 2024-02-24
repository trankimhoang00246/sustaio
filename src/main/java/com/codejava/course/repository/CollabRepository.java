package com.codejava.course.repository;

import com.codejava.course.model.entity.Collab;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CollabRepository extends JpaRepository<Collab, Long> {
    List<Collab> findAllByCategory_Id(long categoryId);
}
