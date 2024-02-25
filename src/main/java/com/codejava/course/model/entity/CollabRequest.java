package com.codejava.course.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "collab_request")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CollabRequest extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    @Column(length = 1000000)
    private String description;
    private String photographicEvidenceUrl; //ảnh minh chứng
    private String status;
    @ManyToOne(fetch = FetchType.EAGER)
    private Collab collab;
    @ManyToOne(fetch = FetchType.EAGER)
    private User user;
}
