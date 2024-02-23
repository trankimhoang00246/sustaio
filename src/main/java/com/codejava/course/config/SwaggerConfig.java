package com.codejava.course.config;

import com.codejava.course.utils.AppUtils;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
public class SwaggerConfig {
    private final AppUtils appUtils;

        @Bean
        public OpenAPI customizeOpenAPI() {
            final String securitySchemeName = "bearerAuth";
            Contact contact = new Contact();
            contact.setName(appUtils.getContactName());
            contact.setEmail(appUtils.getContactEmail());

            return new OpenAPI()
                    .info(new Info()
                            .title(appUtils.getTitle())
                            .description(appUtils.getDescription())
                            .version(appUtils.getVersion())
                            .contact(contact))
                    .addSecurityItem(new SecurityRequirement()
                            .addList(securitySchemeName))
                    .components(new Components()
                            .addSecuritySchemes(securitySchemeName, new SecurityScheme()
                                    .name(securitySchemeName)
                                    .type(SecurityScheme.Type.HTTP)
                                    .scheme("bearer")
                                    .bearerFormat("JWT")));
        }

    }