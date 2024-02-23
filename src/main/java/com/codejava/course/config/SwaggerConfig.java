package com.codejava.course.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties("app.api")
@Getter
@Setter
public class SwaggerConfig {
    private String version;
    private String title;
    private String description;
    private String contactName;
    private String contactEmail;

        @Bean
        public OpenAPI customizeOpenAPI() {
            final String securitySchemeName = "bearerAuth";
            Contact contact = new Contact();
            contact.setName(contactName);
            contact.setEmail(contactEmail);

            return new OpenAPI()
                    .info(new Info()
                            .title(title)
                            .description(description)
                            .version(version)
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