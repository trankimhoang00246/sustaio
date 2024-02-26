package com.codejava.course.service;

import com.codejava.course.model.dto.NotificationMassageDto;

public interface NotificationMessagingService {
    String sendNotification(NotificationMassageDto notificationMassageDto);
}
