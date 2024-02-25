package com.codejava.course.model.form;

import com.codejava.course.model.entity.CollabRequest;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class CollabRequestForm {
    @NotEmpty(message = "Name is required")
    @Min(value = 5, message = "Username must be at least 5 characters long")
    private String fullName;
    @NotEmpty(message = "Email is required")
    @Email(message = "Email is not valid")
    private String email;
    @NotEmpty(message = "Phone is required")
    @Min(value = 10, message = "Phone must be at least 10 characters long")
    private String phone;
    @NotEmpty(message = "Address is required")
    @Min(value = 5, message = "Address must be at least 5 characters long")
    private String address;
    @NotEmpty(message = "Description is required")
    private String description;
    private String photographicEvidenceUrl; //ảnh minh chứng
    @NotNull(message = "Collab id is required")
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
