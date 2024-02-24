package com.codejava.course.service.impl;

import com.codejava.course.model.dto.CollabDto;
import com.codejava.course.repository.CategoryRepository;
import com.codejava.course.repository.CollabRepository;
import com.codejava.course.service.CollabService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CollabServiceImpl implements CollabService {
    private final CollabRepository collabRepository;
    private final CategoryRepository categoryRepository;

    @Override
    public List<CollabDto> getAllCollabs() {
        return collabRepository.findAll()
                .stream()
                .map(CollabDto::from)
                .toList();
    }

    @Override
    public CollabDto getCollabById(long id) {
        return CollabDto.from(collabRepository.findById(id)
                .orElseThrow(()
                        -> new IllegalArgumentException("Collab not found with id: " + id)));
    }

    @Override
    public List<CollabDto> getAllCollabsByCategoryId(long categoryId) {
        if(!categoryRepository.existsById(categoryId))
            throw new IllegalArgumentException("Category not found with id: " + categoryId);

        return collabRepository.findAllByCategory_Id(categoryId)
                .stream()
                .map(CollabDto::from)
                .toList();
    }
}
