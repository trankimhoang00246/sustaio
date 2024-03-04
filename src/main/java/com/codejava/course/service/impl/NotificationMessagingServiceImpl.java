package com.codejava.course.service.impl;

import com.codejava.course.model.dto.NotificationMassageDto;
import com.codejava.course.service.NotificationMessagingService;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2
public class NotificationMessagingServiceImpl implements NotificationMessagingService {
    private final FirebaseMessaging firebaseMessaging;

    public String sendNotification(NotificationMassageDto notificationMassageDto) {
        Notification notification = Notification.builder()
                .setTitle(notificationMassageDto.getTitle())
                .setBody(notificationMassageDto.getMessage())
                .setImage(notificationMassageDto.getImageUrl())
                .build();

        Message msg = Message.builder()
                .setToken(notificationMassageDto.getRecipientToken())
                .setNotification(notification)
                //.putAllData(notificationMassageDto.getData())
                .setTopic(notificationMassageDto.getTopic())
                .build();

        try {
            String id = firebaseMessaging.send(msg);
            log.info("Successfully sent message: " + msg);
            return id;
        } catch (FirebaseMessagingException e) {
            e.printStackTrace();
            return "Error sending message: " + e.getMessage();
        }
    }
}
