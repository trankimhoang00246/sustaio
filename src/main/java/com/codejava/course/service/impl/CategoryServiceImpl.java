package com.codejava.course.service.impl;

import com.codejava.course.model.dto.CategoryDto;
import com.codejava.course.repository.CategoryRepository;
import com.codejava.course.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;

    @Override
    public List<CategoryDto> getAll() {
        return categoryRepository.findAll()
                .stream()
                .map(CategoryDto::from)
                .toList();
    }
}
