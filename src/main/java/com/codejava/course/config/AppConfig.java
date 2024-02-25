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
                            .name("Tổng Công Ty Lương Thực Miền Nam")
                            .username("enterprise1")
                            .password(passwordEncoder.encode("enterprise"))
                            .role(enterpriseRole)
                            .avatarUrl("https://finance.vietstock.vn/image/VSF")
                            .build());
        }
        if(!userRepository.existsByUsername("enterprise2")) {
            userRepository.save(
                    User.builder()
                            .id(4L)
                            .name("Tổng Công Ty Cổ Phần Thương Mại Lương Thực Thực Phẩm Hà Nội")
                            .username("enterprise2")
                            .password(passwordEncoder.encode("enterprise"))
                            .role(enterpriseRole)
                            .avatarUrl("https://i.meeymedia.com/-FHB8Cou9VOojgPfaNJwpcNML0F5uwPdgv6wRj1JPbg/rs:auto:380:0/g:no/czM6Ly9tZWV5bGFuZC1jbXMvdXBsb2Fkcy9pbWFnZXMvMjAyMi8wMy8zMS9jb25nLXR5LWx1b25nLXRodWMtbWllbi1iYWMtNC0xNjQ4NjY0OTk1LmpwZw.jpg")
                            .build());
        }
        log.info("Users initialized successfully");

        for(int i = 1; i <= 10; i++) {
            String title = "Thông báo " + i;
            String message = "Nội dung thông báo " + i;
            notificationRepository.save(
                    Notification.builder()
                            .title(title)
                            .content(message)
                            .user(userRepository.findById(2L).get())
                            .imageUrl("https://i.pinimg.com/564x/22/d5/4f/22d54f223bc23827d933320f7f66380c.jpg")
                            .build());
        }
        log.info("Notifications initialized successfully");

        Category category1 = categoryRepository.save(Category.builder().id(1L).name("Rau củ").build());
        Category category2 =  categoryRepository.save(Category.builder().id(2L).name("Trái cây").build());
        Category category3 = categoryRepository.save(Category.builder().id(3L).name("Thủy sản").build());
        Category category4 = categoryRepository.save(Category.builder().id(4L).name("Gia súc").build());
        Category category5 = categoryRepository.save(Category.builder().id(5L).name("Gia cầm").build());
        Category category6 = categoryRepository.save(Category.builder().id(6L).name("Nguyên liệu chế biến").build());
        Category category7 = categoryRepository.save(Category.builder().id(7L).name("Cây công nghiệp").build());
        Category category8 = categoryRepository.save(Category.builder().id(8L).name("Cây lâm nghiệp").build());
        Category category9 = categoryRepository.save(Category.builder().id(9L).name("Cây dược liệu").build());
        Category category10 = categoryRepository.save(Category.builder().id(10L).name("Cây ăn quả").build());
        log.info("Categories initialized successfully");


        for(Long i = 1L; i <= 10L; i++) {
            for (Long j =1L; j <= 20L; j++) {
                Category categoryPost = categoryRepository.findById(i).get();
                String title = "Bài viết " + j + " - " + categoryPost.getName();
                String message = "Nội dung bài viết " + j;
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
                        .content("Tên Công Ty: Tổng Công Ty Lương Thực Miền Nam\n" +
                                "Lĩnh Vực Hoạt Động: Lương thực và thực phẩm\n" +
                                "Mục Tiêu Kinh Doanh: Tổng Công Ty Lương Thực Miền Nam có thể có mục tiêu cung cấp sản phẩm lương thực chất lượng và đa dạng để đáp ứng nhu cầu người tiêu dùng. Công ty có thể cam kết đảm bảo chất lượng sản phẩm và duy trì mối quan hệ tốt với nhà cung ứng và đối tác kinh doanh.\n" +
                                "Phạm Vi Hoạt Động: Có thể mô tả về phạm vi địa lý mà công ty phục vụ, có phải là quốc gia, khu vực hay quốc tế không.\n" +
                                "Sản Phẩm và Dịch Vụ: Nêu rõ những sản phẩm và dịch vụ chính mà công ty cung cấp. Điều này có thể bao gồm các loại lương thực như gạo, ngũ cốc, bột mì, và các sản phẩm liên quan.\n" +
                                "Chất Lượng và An Toàn Thực Phẩm: Tổng Công Ty Lương Thực Miền Nam có thể chú trọng vào việc duy trì các tiêu chuẩn chất lượng cao và đảm bảo an toàn thực phẩm cho khách hàng.\n" +
                                "Giá Trị Cốt Lõi: Mô tả về giá trị cốt lõi của công ty, có thể là sự cam kết về bền vững, chất lượng, sáng tạo, hoặc những giá trị cụ thể khác.\n" +
                                "Lịch Sử và Phát Triển: Tóm tắt lịch sử phát triển của công ty, bao gồm những thành tựu lớn và các sự kiện quan trọng trong quá khứ.")
                        .otherContent("")
                        .descEnterprise("Tổng công ty Lương thực miền Nam là một trong những Doanh nghiệp kinh doanh lúa gạo lớn trên thế giới với mức chế biến và xuất khẩu bình quân hàng năm đạt khoảng 2,8 – 3,0 triệu tấn gạo, kim ngạch xuất khẩu hàng năm trên 1 tỷ USD, doanh số trên 30.000 tỷ đồng.")
                        .address("36 Tân Chánh Hiệp 18, Tân Chánh Hiệp,  Quận 12, TP. Hồ Chí Minh, Việt Nam")
                        .verified(true)
                        .category(category2)
                        .coverImageUrl("https://i.pinimg.com/564x/d9/38/7e/d9387e57f33bb10595442deb4819651b.jpg")
                        .user(userRepository.findById(3L).get())
                        .build()
        );
        Collab collab2 = collabRepository.save(
                Collab.builder()
                        .id(2L)
                        .content("Tên Công Ty: Tổng Công Ty Cổ Phần Thương Mại Lương Thực Thực Phẩm Hà Nội\n" +
                                "Lĩnh Vực Hoạt Động: Cung cấp và thương mại các sản phẩm lương thực và thực phẩm.\n" +
                                "Tầm Nhìn và Sứ Mệnh:\n" +
                                "Tầm Nhìn: Trở thành đối tác đáng tin cậy hàng đầu trong lĩnh vực lương thực và thực phẩm tại Việt Nam và khu vực.\n" +
                                "Sứ Mệnh: Mang lại những sản phẩm lương thực chất lượng cao, an toàn và dinh dưỡng cho cộng đồng, đồng thời xây dựng mối quan hệ đối tác bền vững với các đối tác kinh doanh.\n" +
                                "Danh Mục Sản Phẩm và Dịch Vụ:\n" +
                                "Cung cấp và phân phối các loại gạo, ngũ cốc, bột mì, thực phẩm chế biến sẵn, và các sản phẩm lương thực đa dạng.\n" +
                                "Dịch vụ nhập khẩu và xuất khẩu lương thực để đáp ứng nhu cầu thị trường quốc tế.\n" +
                                "Chất Lượng và An Toàn Thực Phẩm:\n" +
                                "Tuân thủ nghiêm ngặt các tiêu chuẩn chất lượng và an toàn thực phẩm quốc tế.\n" +
                                "Sử dụng quy trình kiểm soát chất lượng hiện đại và công nghệ tiên tiến để đảm bảo sản phẩm đáp ứng hoặc vượt qua các yêu cầu khắt khe.\n" +
                                "Bền Vững và Trách Nhiệm Xã Hội:\n" +
                                "Cam kết đối với các hoạt động bền vững và bảo vệ môi trường.\n" +
                                "Tham gia vào các hoạt động xã hội như cung ứng lương thực cho cộng đồng nghèo, hỗ trợ giáo dục, và các dự án xã hội khác.\n" +
                                "Đối Tác và Mối Quan Hệ:\n" +
                                "Xây dựng mối quan hệ đối tác đáng tin cậy và lâu dài với những đối tác cung ứng và khách hàng.\n" +
                                "Hợp tác chặt chẽ với các đối tác để đảm bảo chuỗi cung ứng ổn định và đáng tin cậy.\n" +
                                "Lịch Sử và Thành Tựu:\n" +
                                "Thành lập với truyền thống lâu dài và kinh nghiệm trong ngành lương thực và thực phẩm.\n" +
                                "Đã đạt được những thành công lớn trong việc mở rộng quy mô kinh doanh và mở rộng quốc tế.")
                        .otherContent("Liên hệ với chúng tôi để biết thêm thông tin chi tiết về cách thức hợp tác và các sản phẩm cung cấp.")
                        .descEnterprise("Tổng Công Ty Cổ Phần Thương Mại Lương Thực Thực Phẩm Hà Nội có thể có mục tiêu cung cấp sản phẩm lương thực chất lượng và đa dạng để đáp ứng nhu cầu người tiêu dùng. Công ty có thể cam kết đảm bảo chất lượng sản phẩm và duy trì mối quan hệ tốt với nhà cung ứng và đối tác kinh doanh.")
                        .address("720A Đ. Điện Biên Phủ, Vinhomes Tân Cảng, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam")
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
                        .fullName("Nguyễn Văn A")
                        .email("kinchana@gmail.com")
                        .phone("0123456789")
                        .address("02 Võ Oanh, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam")
                        .description("Tôi muốn hợp tác với Tổng Công Ty Lương Thực Miền Nam để cung cấp sản phẩm lương thực của mình.")
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
