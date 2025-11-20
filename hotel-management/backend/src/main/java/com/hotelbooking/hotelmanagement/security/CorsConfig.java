package com.hotelbooking.hotelmanagement.security;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.lang.NonNull;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Arrays;
import java.util.List;

@Configuration
public class CorsConfig {

    @Value("${cors.allowed.origins:*}")
    private String allowedOrigins;

    /**
     * CORS configuration source for Spring Security
     * This is the PRIMARY CORS configuration that Spring Security will use
     */
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        
        String originsValue = allowedOrigins != null ? allowedOrigins : "*";
        String[] origins = Arrays.stream(originsValue.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .toArray(String[]::new);
        
        // If using wildcard "*", cannot use allowCredentials
        boolean useWildcard = origins.length == 1 && "*".equals(origins[0]);
        
        if (useWildcard) {
            configuration.setAllowedOrigins(List.of("*"));
        } else {
            configuration.setAllowedOrigins(Arrays.asList(origins));
            configuration.setAllowCredentials(true);
        }
        
        // Allow all HTTP methods including OPTIONS
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH"));
        
        // Allow all headers
        configuration.setAllowedHeaders(Arrays.asList("*"));
        
        // Allow credentials (cookies, authorization headers)
        if (!useWildcard) {
            configuration.setAllowCredentials(true);
        }
        
        // Expose headers that the frontend might need
        configuration.setExposedHeaders(Arrays.asList("Authorization", "Content-Type"));
        
        // Cache preflight response for 1 hour
        configuration.setMaxAge(3600L);
        
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    /**
     * WebMvcConfigurer for additional CORS support (backup)
     * This ensures CORS works even if Spring Security filter doesn't catch it
     */
    @Bean
    public WebMvcConfigurer webMvcConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            @SuppressWarnings("null")
            public void addCorsMappings(@NonNull CorsRegistry registry) {
                String originsValue = allowedOrigins != null ? allowedOrigins : "*";
                String[] origins = Arrays.stream(originsValue.split(","))
                        .map(String::trim)
                        .filter(s -> !s.isEmpty())
                        .toArray(String[]::new);
                
                // If using wildcard "*", cannot use allowCredentials
                boolean useWildcard = origins.length == 1 && "*".equals(origins[0]);
                
                if (useWildcard) {
                    registry.addMapping("/**")
                            .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH")
                            .allowedOrigins("*")
                            .allowedHeaders("*")
                            .maxAge(3600);
                } else {
                    registry.addMapping("/**")
                            .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH")
                            .allowedOrigins(origins)
                            .allowedHeaders("*")
                            .allowCredentials(true)
                            .maxAge(3600);
                }
            }
        };
    }
}

