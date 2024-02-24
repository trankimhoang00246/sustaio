package com.codejava.course.service.impl;

import com.codejava.course.model.dto.PostDto;
import com.codejava.course.model.entity.Post;
import com.codejava.course.repository.CategoryRepository;
import com.codejava.course.repository.PostRepository;
import com.codejava.course.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {
    private final PostRepository postRepository;
    private final CategoryRepository categoryRepository;

    @Override
    public List<PostDto> getAll() {
        return postRepository.findAll()
                .stream()
                .map(PostDto::from)
                .toList();
    }

    @Override
    public List<PostDto> getAllByCategoryName(String name) {
        if(!categoryRepository.existsByName(name))
            throw new IllegalArgumentException("Category not found with name: " + name);

        return postRepository.findAllByCategory_Name(name)
                .stream()
                .map(PostDto::from)
                .toList(
        );
    }

    @Override
    public PostDto getById(Long id) {
        return PostDto.from(postRepository.findById(id).orElseThrow(
                () -> new IllegalArgumentException("Post not found with id: " + id)
        ));
    }

    @Override
    public List<PostDto> get5NewestPosts() {
        Sort sort = Sort.by("createdAt").descending();

        Pageable pageable = PageRequest.of(0, 5, sort);
        Page<Post> listPage = postRepository.findAll(pageable);
        return listPage.getContent()
                .stream()
                .map(PostDto::from)
                .toList();
    }
}
