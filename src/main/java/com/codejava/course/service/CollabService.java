package com.codejava.course.service;

import com.codejava.course.model.dto.CollabDto;

import java.util.List;

public interface CollabService {
    List<CollabDto> getAllCollabs();
    CollabDto getCollabById(long id);
    List<CollabDto> getAllCollabsByCategoryId(long categoryId);
}
