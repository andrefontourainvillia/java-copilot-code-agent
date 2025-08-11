package com.mergingtonhigh.schoolmanagement.infrastructure.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Web MVC configuration for static resources.
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    
    // Removido o método addResourceHandlers para usar o padrão do Spring Boot
}