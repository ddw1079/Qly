package com.qly.controller;

import com.qly.dto.UserDto;
import com.qly.dto.admin_QuestDto;
import com.qly.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    // 📌 기본 레이아웃 (기본 페이지: 회원 목록)
    @RequestMapping("/layout.do")
    public String layoutPage(@RequestParam(required = false) String page, Model model) {
        if (page == null || page.trim().isEmpty()) {
            page = "admin_memberList.jsp";
        }
        model.addAttribute("page", page);
        return "admin/admin_layout";
    }

    // ✅ 회원 목록 페이지 (검색 포함)
    @RequestMapping("/memberList.do")
    public String showMemberList(@RequestParam(required = false) String keyword, Model model) {
        List<UserDto> userList = (keyword != null && !keyword.trim().isEmpty())
                ? adminService.searchUsers(keyword)
                : adminService.getAllUsers();

        int totalUsers = adminService.getTotalUserCount();
        int totalQuestCount = adminService.getTotalQuestCount();

        model.addAttribute("userList", userList);
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("totalQuestCount", totalQuestCount);
        model.addAttribute("page", "admin_memberList.jsp");

        return "admin/admin_layout";
    }

    // ✅ 회원 삭제
    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam String userId, @RequestParam(required = false) String keyword) {
        adminService.deleteUser(userId);
        return "redirect:/admin/memberList.do" + (keyword != null ? "?keyword=" + keyword : "");
    }

    // ✅ 퀘스트 목록 페이지 (검색 포함)
    @RequestMapping("/questList.do")
    public String showQuestList(@RequestParam(required = false) String keyword, Model model) {
        List<admin_QuestDto> questList = (keyword != null && !keyword.trim().isEmpty())
                ? adminService.searchQuests(keyword)
                : adminService.getAllQuests();

        int totalQuestCount = adminService.getTotalQuestCount();
        int progressCount = adminService.countQuestByStatus("진행중");
        int doneCount = adminService.countQuestByStatus("완료");
        int recentCount = adminService.countRecentQuests();

        model.addAttribute("questList", questList);
        model.addAttribute("totalQuestCount", totalQuestCount);
        model.addAttribute("progressCount", progressCount);
        model.addAttribute("doneCount", doneCount);
        model.addAttribute("recentCount", recentCount);
        model.addAttribute("page", "admin_questList.jsp");

        return "admin/admin_layout";
    }

    // ✅ 코인 관리 페이지
    @RequestMapping("/coinList.do")
    public String showCoinList(Model model) {
        // 추후: model.addAttribute("coinLogs", adminService.getCoinLogs());
        model.addAttribute("page", "admin_coinList.jsp");
        return "admin/admin_layout";
    }

    // ✅ 사용자 문의 관리 페이지
    @RequestMapping("/questionList.do")
    public String showQuestionList(Model model) {
        // 추후: model.addAttribute("questions", adminService.getAllQuestions());
        model.addAttribute("page", "admin_question.jsp");
        return "admin/admin_layout";
    }
    
}
