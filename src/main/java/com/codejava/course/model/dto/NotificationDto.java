package com.codejava.course.model.dto;

import com.codejava.course.model.entity.Notification;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class NotificationDto {
    private Long id;
    private String title;
    private String content;
    private String imageUrl;

    public static NotificationDto from(Notification notification) {
        return NotificationDto.builder()
                .id(notification.getId())
                .title(notification.getTitle())
                .content(notification.getContent())
                .imageUrl(notification.getImageUrl())
                .build();
    }
}
