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
        // �α����� ����� ���� ���ǿ��� ������
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login/loginForm";  // �α��� �� �Ǿ������� �α��� ��������
        }

        // ����� ID�� DB���� �ֽ� ���� ��ȸ
        UserDto userInfo = qlyService.getUserById(loginUser.getUserId());
        model.addAttribute("userInfo", userInfo);  // JSP�� ������ ������

        // user_layout.jsp �� �̵�
        return "mypage/propile_Quest/user_layout";
    }
}
