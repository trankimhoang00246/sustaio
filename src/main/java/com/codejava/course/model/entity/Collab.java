package com.codejava.course.model.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "collabs")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Collab extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String content;
    private String otherContent;
    private String descEnterprise;
    private String address;
    private Boolean verified;
    private String coverImageUrl;
    @ManyToOne(fetch = FetchType.EAGER)
    private Category category;
    @OneToOne(fetch = FetchType.EAGER)
    private User user;
}
