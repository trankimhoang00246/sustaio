package com.codejava.course.model.form;

import com.codejava.course.model.dto.CollabDto;
import com.codejava.course.model.dto.UserDto;
import com.codejava.course.model.entity.CollabRequest;
import lombok.Data;

@Data
public class CollabRequestForm {
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String description;
    private String photographicEvidenceUrl; //ảnh minh chứng
    private long collabId;

    public static CollabRequest toEntity(CollabRequestForm collabRequestForm) {
        return CollabRequest.builder()
                .fullName(collabRequestForm.getFullName())
                .email(collabRequestForm.getEmail())
                .phone(collabRequestForm.getPhone())
                .address(collabRequestForm.getAddress())
                .description(collabRequestForm.getDescription())
                .photographicEvidenceUrl(collabRequestForm.getPhotographicEvidenceUrl())
                .status("PENDING")
                .build();
    }
}
