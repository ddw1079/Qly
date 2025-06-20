package com.qly.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qly.dto.UserDto;
import com.qly.service.QlyService;

@Controller
public class MypageController {

    @Autowired
    private QlyService qlyService;

    @RequestMapping("/mypage/user")
    public String goUserLayout(HttpSession session, Model model) {
        // 로그인한 사용자 정보 세션에서 꺼내기
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login/loginForm";  // 로그인 안 되어있으면 로그인 페이지로
        }

        // 사용자 ID로 DB에서 최신 정보 조회
        UserDto userInfo = qlyService.getUserById(loginUser.getUserId());
        model.addAttribute("userInfo", userInfo);  // JSP에 전달할 데이터

        // user_layout.jsp 로 이동
        return "mypage/propile_Quest/user_layout";
    }
}
