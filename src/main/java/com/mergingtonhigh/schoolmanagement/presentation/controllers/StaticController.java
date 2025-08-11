package com.mergingtonhigh.schoolmanagement.presentation.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Controller for serving static content.
 */
@Controller
public class StaticController {
    
    /**
     * Serve the main index page.
     * Returning "forward:/index.html" em vez de "redirect:/index.html"
     * para evitar problemas de CORS com redirecionamentos entre domínios
     */
    @GetMapping("/")
    public String index() {
        return "forward:/index.html";
    }
}