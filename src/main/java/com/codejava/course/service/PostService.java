package com.codejava.course.service;

import com.codejava.course.model.dto.PostDto;

import java.util.List;

public interface PostService {
    List<PostDto> getAll();
    List<PostDto> getAllByCategoryName(String name);
    PostDto getById(Long id);
    List<PostDto> get5NewestPosts();
}
