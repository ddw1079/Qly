package com.qly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/mainpage")
    public String showMainPage() {
        return "mainpage"; // ¡æ /WEB-INF/views/mainpage.jsp
    }

    @RequestMapping("/") // ±âº» È¨ URL
    public String home() {
        return "redirect:/mainpage";
    }
}
