package com.codejava.course.service.impl;

import com.codejava.course.model.dto.NotificationDto;
import com.codejava.course.repository.NotificationRepository;
import com.codejava.course.repository.UserRepository;
import com.codejava.course.service.NotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {
    private final NotificationRepository notificationRepository;
    private final UserRepository userRepository;

    @Override
    public List<NotificationDto> getNotificationsByUserId(long id) {
        if(!userRepository.existsById(id))
            throw new IllegalArgumentException("User not found with id: " + id);

        return notificationRepository.findAllByUser_Id(id)
                .stream()
                .map(NotificationDto::from)
                .toList();
    }
}
