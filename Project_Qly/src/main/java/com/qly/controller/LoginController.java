package com.qly.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.qly.dto.UserDto;
import com.qly.service.QlyService;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private QlyService qlyService;

 // 로그인 폼
    @RequestMapping(value = "/loginForm", method = RequestMethod.GET)
    public String showLoginForm() {
        return "userlogin/UserLogin";
    }

    // 로그인 처리
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {
        UserDto user =  qlyService.login(username, password);
        System.out.println(user);

        if (user != null) {
            session.setAttribute("loginUser", user);
            return "mainpage";
        } else {
            model.addAttribute("loginError", "아이디 또는 비밀번호가 틀렸습니다.");
            return "userlogin/UserLogin";
        }
    }
}

