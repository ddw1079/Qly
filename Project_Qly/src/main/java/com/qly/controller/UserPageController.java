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
            page = "personal_info.jsp"; // �⺻ ������
        }

        Object loginUser = session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login/loginForm"; // �α��� �� �� ���
        }

        model.addAttribute("page", page); // JSP���� <c:choose>��
        return "mapage/user_layout"; // views/mapage/user_layout.jsp
    }
}