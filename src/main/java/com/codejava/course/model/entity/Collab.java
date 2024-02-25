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
    @Column(length = 1000000)
    private String content;
    @Column(length = 1000000)
    private String otherContent;
    @Column(length = 1000000)
    private String descEnterprise;
    private String address;
    private Boolean verified;
    private String coverImageUrl;
    @ManyToOne(fetch = FetchType.EAGER)
    private Category category;
    @OneToOne(fetch = FetchType.EAGER)
    private User user;
}
