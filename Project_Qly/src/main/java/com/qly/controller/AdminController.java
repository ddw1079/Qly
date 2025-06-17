package com.qly.controller;

import com.qly.dto.QuestDto;
import com.qly.dto.UserDto;
import com.qly.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

   @Autowired
   private AdminService adminService;
   
   @RequestMapping("/layout.do")
   public String layoutPage(@RequestParam(required = false) String page, Model model) {
       if (page == null || page.trim().isEmpty()) {
           page = "admin_memberList.jsp"; // 기본 페이지
       }
       model.addAttribute("page", page); // JSP로 전달
       return "admin/admin_layout";
   }


   // 회원 목록 (검색 포함)
   @RequestMapping(value = "/memberList.do")
   public String showMemberList(@RequestParam(required = false) String keyword, Model model) {
      List<UserDto> userList = (keyword != null && !keyword.trim().isEmpty()) 
    		? adminService.searchUsers(keyword)
            : adminService.getAllUsers();
      
      int totalUsers = adminService.getTotalUserCount(); // 🔹 추가: 총 회원 수 조회

      model.addAttribute("userList", userList);
      model.addAttribute("totalUsers", totalUsers);      // 🔹 JSP로 전달
      return "admin/admin_layout"; // JSP 직접 연결
   }

   // 회원 삭제
   @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
   public String deleteUser(@RequestParam String userId, @RequestParam(required = false) String keyword) {
      adminService.deleteUser(userId);
      return "redirect:/admin/memberList" + (keyword != null ? "?keyword=" + keyword : "");
   }

   // 퀘스트 목록
   @RequestMapping(value = "/questList.do")
   public String showQuestList(@RequestParam(required = false) String keyword, Model model) {
       List<QuestDto> questList = (keyword != null && !keyword.trim().isEmpty())
           ? adminService.searchQuests(keyword)
           : adminService.getAllQuests();

       model.addAttribute("questList", questList);
       return "admin_questList"; 
   }

}
