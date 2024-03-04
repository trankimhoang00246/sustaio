package com.codejava.course.controller;

import com.codejava.course.model.dto.AuthDto;
import com.codejava.course.model.dto.NotificationMassageDto;
import com.codejava.course.model.form.LoginForm;
import com.codejava.course.model.form.RegisterForm;
import com.codejava.course.service.AuthService;
import com.codejava.course.service.NotificationMessagingService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;
    private final NotificationMessagingService notificationMessagingService;


    @PostMapping("/login")
    public ResponseEntity login(@RequestBody LoginForm form){
        AuthDto authDto = authService.login(form);

        notificationMessagingService.sendNotification(
                NotificationMassageDto.builder()
                        .recipientToken("eId9noRKRaS6A39G8ysFjx:APA91bFfKYC2LCDP5PC-JYhaRWPIsrASu-My5Z63TOUoQKAWzEtAQy_pB_ealgHkrdO7e8-HDzj2KbEgWQU4KeCos3J3xYxcAS9TxGsMYukCq3F243BM9gT6vrr5ENPdhCIk79fY_3aW")
                        .title("User logged in")
                        .message("Welcome to" + authDto.getUsername() + "!")
                        .topic("user_logged_in")
                        .imageUrl("https://i.pinimg.com/564x/5f/40/6a/5f406ab25e8942cbe0da6485afd26b71.jpg")
                        .build()
        );
        return ResponseEntity.ok(authDto);
    }

    @PostMapping("/register")
    public ResponseEntity<String> login(@RequestBody @Valid RegisterForm form){
        return ResponseEntity.ok(authService.register(form));
    }

    @GetMapping("/refresh")
    public ResponseEntity refreshToken(@RequestHeader("X-Refresh-Token") String refreshToken){
        return ResponseEntity.ok(authService.refreshJWT(refreshToken));
    }
}
