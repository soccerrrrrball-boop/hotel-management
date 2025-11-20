package com.hotelbooking.hotelmanagement.security;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * CORS Filter that runs BEFORE Spring Security filters
 * This ensures OPTIONS preflight requests are handled correctly
 */
@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class CorsFilter implements Filter {

    @Value("${cors.allowed.origins:*}")
    private String allowedOrigins;

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        // Get allowed origins from configuration
        String originsValue = allowedOrigins != null ? allowedOrigins : "*";
        List<String> origins = Arrays.stream(originsValue.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .toList();
        
        // Get the origin from the request
        String origin = request.getHeader("Origin");
        
        // Determine if we should use wildcard
        boolean useWildcard = origins.size() == 1 && "*".equals(origins.get(0));
        
        // Set CORS headers
        if (useWildcard) {
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Credentials", "false");
        } else if (origin != null && origins.contains(origin)) {
            response.setHeader("Access-Control-Allow-Origin", origin);
            response.setHeader("Access-Control-Allow-Credentials", "true");
        } else if (!origins.isEmpty()) {
            // If origin doesn't match but we have specific origins, use the first one as fallback
            // This shouldn't happen in production, but prevents errors
            response.setHeader("Access-Control-Allow-Origin", origins.get(0));
            response.setHeader("Access-Control-Allow-Credentials", "true");
        } else {
            // Fallback to wildcard if no origins configured
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Access-Control-Allow-Credentials", "false");
        }
        
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS, PATCH");
        response.setHeader("Access-Control-Allow-Headers", "*");
        response.setHeader("Access-Control-Expose-Headers", "Authorization, Content-Type");
        response.setHeader("Access-Control-Max-Age", "3600");

        // Handle OPTIONS preflight request
        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
            response.setStatus(HttpServletResponse.SC_OK);
            return; // Don't continue the filter chain for OPTIONS
        }

        chain.doFilter(req, res);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // No initialization needed
    }

    @Override
    public void destroy() {
        // No cleanup needed
    }
}

