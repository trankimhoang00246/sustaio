package com.codejava.course.model.dto;

import com.codejava.course.model.entity.Post;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Builder
@Data
public class PostDto {
    private Long id;
    private String title;
    private String content;
    private String imageUrl;
    private CategoryDto categoryDto;
    protected LocalDateTime createdAt;
    protected LocalDateTime updatedAt;

    public static PostDto from(Post post) {
        return PostDto.builder()
                .id(post.getId())
                .title(post.getTitle())
                .content(post.getContent())
                .imageUrl(post.getImageUrl())
                .categoryDto(CategoryDto.from(post.getCategory()))
                .createdAt(post.getCreatedAt())
                .updatedAt(post.getUpdatedAt())
                .build();
    }
}
