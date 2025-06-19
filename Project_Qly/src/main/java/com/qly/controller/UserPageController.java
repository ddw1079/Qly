package com.qly.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/mypage")
public class UserPageController {

    @RequestMapping("/user_layout.do")
    public String showUserLayout(@RequestParam(value = "page", required = false) String page,
                                 HttpSession session,
                                 Model model) {

        if (page == null || page.trim().isEmpty()) {
            page = "personal_info.jsp"; // 기본 페이지
        }

        Object loginUser = session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login/loginForm"; // 로그인 안 된 경우
        }

        model.addAttribute("page", page); // JSP에서 <c:choose>용
        return "mapage/user_layout"; // views/mapage/user_layout.jsp
    }
}