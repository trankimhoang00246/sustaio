package com.codejava.course.model.dto;

import com.codejava.course.model.entity.Collab;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CollabDto {
    private Long id;
    private String content;
    private String otherContent;
    private String descEnterprise;
    private String address;
    private Boolean verified;
    private String coverImageUrl;

    private CategoryDto categoryDto;
    private UserDto userDto;

    public static CollabDto from(Collab collab) {
        return CollabDto.builder()
                .id(collab.getId())
                .content(collab.getContent())
                .otherContent(collab.getOtherContent())
                .descEnterprise(collab.getDescEnterprise())
                .address(collab.getAddress())
                .verified(collab.getVerified())
                .coverImageUrl(collab.getCoverImageUrl())
                .categoryDto(CategoryDto.from(collab.getCategory()))
                .userDto(UserDto.from(collab.getUser()))
                .build();
    }
}
