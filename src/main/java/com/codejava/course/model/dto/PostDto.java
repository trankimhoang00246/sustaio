package com.codejava.course.model.dto;

import com.codejava.course.model.entity.Post;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class PostDto {
    private Long id;
    private String title;
    private String content;
    private String imageUrl;
    private CategoryDto categoryDto;

    public static PostDto from(Post post) {
        return PostDto.builder()
                .id(post.getId())
                .title(post.getTitle())
                .content(post.getContent())
                .imageUrl(post.getImageUrl())
                .categoryDto(CategoryDto.from(post.getCategory()))
                .build();
    }
}
