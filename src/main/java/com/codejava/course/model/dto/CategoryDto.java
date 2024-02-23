package com.codejava.course.model.dto;

import com.codejava.course.model.entity.Category;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class CategoryDto {
    private Long id;
    private String name;

    public static CategoryDto from(Category category) {
        return CategoryDto.builder()
                .id(category.getId())
                .name(category.getName())
                .build();
    }
}
