package com.codejava.course.service.impl;

import com.codejava.course.model.dto.NotificationDto;
import com.codejava.course.model.entity.User;
import com.codejava.course.repository.NotificationRepository;
import com.codejava.course.repository.UserRepository;
import com.codejava.course.service.NotificationService;
import com.codejava.course.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {
    private final NotificationRepository notificationRepository;
    private final UserRepository userRepository;

    @Override
    public List<NotificationDto> getMyNotifications() {
        User user = userRepository.findByUsername(SecurityUtils.getUsernameOfPrincipal())
                .orElseThrow(() -> new IllegalArgumentException("User not found with username: " + SecurityUtils.getUsernameOfPrincipal()));

        return notificationRepository.findAllByUser_Id(user.getId())
                .stream()
                .map(NotificationDto::from)
                .toList();
    }
}
