package com.codejava.course.config;

import com.codejava.course.model.entity.*;
import com.codejava.course.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@RequiredArgsConstructor
@Log4j2
public class AppConfig {
    private final RoleRepository roleRepository;
    private final UserRepository userRepository;

    private final CategoryRepository categoryRepository;
    private final PostRepository postRepository;
    private final CollabRepository collabRepository;
    private final CollabRequestRepository collabRequestRepository;

    private final NotificationRepository notificationRepository;
    private final PasswordEncoder passwordEncoder;

    @Bean
    public void initApp() {
        if(!roleRepository.existsRoleByName("ROLE_ADMIN"))
            roleRepository.save(Role.builder().id(1L).name("ROLE_ADMIN").build());
        if(!roleRepository.existsRoleByName("ROLE_FARMER"))
            roleRepository.save(Role.builder().id(2L).name("ROLE_FARMER").build());
        if(!roleRepository.existsRoleByName("ROLE_ENTERPRISE"))
            roleRepository.save(Role.builder().id(3L).name("ROLE_ENTERPRISE").build());
        log.info("Roles initialized successfully");

        Role adminRole = roleRepository.findById(1L).get();
        Role farmerRole = roleRepository.findById(2L).get();
        Role enterpriseRole = roleRepository.findById(3L).get();
        if(!userRepository.existsByUsername("admin")) {
            userRepository.save(
                    User.builder()
                            .id(1L)
                            .name("Admin")
                            .username("admin")
                            .password(passwordEncoder.encode("admin"))
                            .role(adminRole)
                            .avatarUrl("https://i.pinimg.com/564x/5f/40/6a/5f406ab25e8942cbe0da6485afd26b71.jpg")
                            .build());
        }
        if(!userRepository.existsByUsername("farmer")) {
            userRepository.save(
                    User.builder()
                            .id(2L)
                            .name("Farmer A")
                            .username("farmer")
                            .password(passwordEncoder.encode("farmer"))
                            .role(farmerRole)
                            .avatarUrl("https://i.pinimg.com/564x/8a/dc/7a/8adc7a0ce98bc961743fbdd058e0dd24.jpg")
                            .build());
        }
        if(!userRepository.existsByUsername("enterprise1")) {
            userRepository.save(
                    User.builder()
                            .id(3L)
                            .name("Southern Food Corporation")
                            .username("enterprise1")
                            .password(passwordEncoder.encode("enterprise"))
                            .role(enterpriseRole)
                            .avatarUrl("https://lennguyenmedia.com/wp-content/uploads/2023/10/Chung-thu-tham-dinh-Thuc-pham-an-toan.jpg")
                            .build());
        }
        if(!userRepository.existsByUsername("enterprise2")) {
            userRepository.save(
                    User.builder()
                            .id(4L)
                            .name("The Hanoi Foodstuff and Food Trading Joint Stock Company")
                            .username("enterprise2")
                            .password(passwordEncoder.encode("enterprise"))
                            .role(enterpriseRole)
                            .avatarUrl("https://i.meeymedia.com/-FHB8Cou9VOojgPfaNJwpcNML0F5uwPdgv6wRj1JPbg/rs:auto:380:0/g:no/czM6Ly9tZWV5bGFuZC1jbXMvdXBsb2Fkcy9pbWFnZXMvMjAyMi8wMy8zMS9jb25nLXR5LWx1b25nLXRodWMtbWllbi1iYWMtNC0xNjQ4NjY0OTk1LmpwZw.jpg")
                            .build());
        }
        log.info("Users initialized successfully");

        for(int i = 1; i <= 10; i++) {
            String title = "Notification " + i;
            String message = "Notification content " + i;
            notificationRepository.save(
                    Notification.builder()
                            .title(title)
                            .content(message)
                            .user(userRepository.findById(2L).get())
                            .imageUrl("https://i.pinimg.com/564x/22/d5/4f/22d54f223bc23827d933320f7f66380c.jpg")
                            .build());
        }
        log.info("Notifications initialized successfully");

        Category category1 = categoryRepository.save(Category.builder().id(1L).name("Vegetables").build());
        Category category2 =  categoryRepository.save(Category.builder().id(2L).name("Fruits").build());
        Category category3 = categoryRepository.save(Category.builder().id(3L).name("Seafood").build());
        Category category4 = categoryRepository.save(Category.builder().id(4L).name("Livestock").build());
        Category category5 = categoryRepository.save(Category.builder().id(5L).name("Poultry").build());
        Category category6 = categoryRepository.save(Category.builder().id(6L).name("Processing Ingredients").build());
        Category category7 = categoryRepository.save(Category.builder().id(7L).name("Industrial Plants").build());
        Category category8 = categoryRepository.save(Category.builder().id(8L).name("Forestry Plants").build());
        Category category9 = categoryRepository.save(Category.builder().id(9L).name("Medicinal Plants").build());
        Category category10 = categoryRepository.save(Category.builder().id(10L).name("Fruit Trees").build());
        log.info("Categories initialized successfully");

        for(Long i = 1L; i <= 10L; i++) {
            for (Long j =1L; j <= 20L; j++) {
                Category categoryPost = categoryRepository.findById(i).get();
                String title = "Post " + j + " - " + categoryPost.getName();
                String message = "Post content " + j;
                postRepository.save(
                        Post.builder()
                                .id((long) (i * 10 + j))
                                .title(title)
                                .content(message)
                                .imageUrl("https://i.pinimg.com/564x/5a/83/7d/5a837d657f81cf04983db6f516c9e8bb.jpg")
                                .category(categoryPost)
                                .build());
            }
        }
        log.info("Posts initialized successfully");

        Collab collab1 = collabRepository.save(
                Collab.builder()
                        .id(1L)
                        .content("Company Name: Southern Food Corporation\n" +
                                "Field of Operation: Grains and Foodstuffs\n" +
                                "History and Development: Summarize the company's history and development, highlighting significant achievements and important events in the past.")
                        .otherContent("")
                        .descEnterprise("Southern Food Corporation is one of the major rice processing and exporting enterprises globally, with an annual processing and export volume of approximately 2.8 – 3.0 million tons of rice, and an annual export turnover exceeding 1 billion USD, with sales over 30,000 billion VND.")
                        .address("District 12, Ho Chi Minh City")
                        .verified(true)
                        .category(category2)
                        .coverImageUrl("https://i.pinimg.com/564x/d9/38/7e/d9387e57f33bb10595442deb4819651b.jpg")
                        .user(userRepository.findById(3L).get())
                        .build()
        );
        Collab collab2 = collabRepository.save(
                Collab.builder()
                        .id(2L)
                        .content("Company Name: The Hanoi Foodstuff and Food Trading Joint Stock Company\n" +
                                "Field of Operation: Supplying and trading grains and foodstuffs.\n" +
                                "History and Achievements:\n" +
                                "Established with a long-standing tradition and experience in the field of food and foodstuff.")
                        .otherContent("Contact us for more detailed information on collaboration methods and the products we provide.")
                        .descEnterprise("The Hanoi Foodstuff and Food Trading Joint Stock Company may aim to provide high-quality and diverse grain products to meet consumer demands. The company may commit to ensuring product quality and maintaining good relationships with suppliers and business partners.")
                        .address("Binh Thanh District, Ho Chi Minh City")
                        .verified(true)
                        .category(category6)
                        .coverImageUrl("https://i.pinimg.com/564x/5a/02/a4/5a02a41c0aeed1836f6502847008535b.jpg")
                        .user(userRepository.findById(4L).get())
                        .build()
        );
        log.info("Collabs initialized successfully");

        CollabRequest collabRequest = collabRequestRepository.save(
                CollabRequest.builder()
                        .id(1L)
                        .fullName("Nguyen Van A")
                        .email("kinchana@gmail.com")
                        .phone("0123456789")
                        .address("02 Vo Oanh, Ward 25, Binh Thanh District, Ho Chi Minh City, Vietnam")
                        .description("I want to collaborate with The Hanoi Foodstuff and Food Trading Joint Stock Company to supply my agricultural products.")
                        .photographicEvidenceUrl("https://maynongnghiepbinhminh.com/wp-content/uploads/2022/08/de-an-co.jpg")
                        .status("PENDING")
                        .collab(collab2)
                        .user(userRepository.findById(2L).get())
                        .build()
        );
        log.info("Collab requests initialized successfully");

        log.info("App initialized successfully");
    }
}
