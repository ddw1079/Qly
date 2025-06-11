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

	// 회원 목록 (검색 포함)
	@RequestMapping(value = "/memberList.do")
	public String showMemberList(@RequestParam(required = false) String keyword, Model model) {
		List<UserDto> userList = (keyword != null && !keyword.trim().isEmpty()) ? adminService.searchUsers(keyword)
				: adminService.getAllUsers();

		model.addAttribute("userList", userList);
		return "AdminMember";
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
		List<QuestDto> questList = adminService.getAllQuests();
		model.addAttribute("questList", questList);
		return "AdminQuest"; // /WEB-INF/views/AdminQuest.jsp 로 연결
	}
}
