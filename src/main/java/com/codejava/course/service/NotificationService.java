package com.codejava.course.service;

import com.codejava.course.model.dto.NotificationDto;

import java.util.List;

public interface NotificationService {
    List<NotificationDto> getMyNotifications();
}
