package com.mergingtonhigh.schoolmanagement.infrastructure.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.lang.NonNull;

/**
 * Web MVC configuration for static resources and CORS.
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    
    // Removido o método addResourceHandlers para usar o padrão do Spring Boot
    @Override
    public void addCorsMappings(@NonNull CorsRegistry registry) {
        registry.addMapping("/**")
            .allowedOriginPatterns("*")
            .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
            .allowedHeaders("*")
            .exposedHeaders("Access-Control-Allow-Origin", "Access-Control-Allow-Credentials")
            .allowCredentials(false);  // Alterado para false para permitir wildcard origins
    }
}