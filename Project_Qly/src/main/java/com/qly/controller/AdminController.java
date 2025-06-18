package com.qly.controller;

import com.qly.dto.QuestDto;
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

	// 📌 관리자 레이아웃 페이지 로드 (기본은 회원 목록 페이지)
	@RequestMapping("/layout.do")
	public String layoutPage(@RequestParam(required = false) String page, Model model) {
		if (page == null || page.trim().isEmpty()) {
			page = "admin_memberList.jsp"; // 기본 페이지
		}
		model.addAttribute("page", page); // 본문으로 include될 JSP 이름
		return "admin/admin_layout";
	}

	// ✅ 회원 목록 (검색 포함)
	@RequestMapping(value = "/memberList.do")
	public String showMemberList(@RequestParam(required = false) String keyword, Model model) {
		List<UserDto> userList = (keyword != null && !keyword.trim().isEmpty()) ? adminService.searchUsers(keyword)
				: adminService.getAllUsers();

		int totalUsers = adminService.getTotalUserCount(); // 전체 회원 수
		int totalQuestCount = adminService.getTotalQuestCount(); // ✅ 퀘스트 수도 조회

		model.addAttribute("userList", userList);
		model.addAttribute("totalUsers", totalUsers);
		model.addAttribute("totalQuestCount", totalQuestCount); // ✅ 모델에 추가
		model.addAttribute("page", "admin_memberList.jsp");

		return "admin/admin_layout";
	}

	// ✅ 회원 삭제
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public String deleteUser(@RequestParam String userId, @RequestParam(required = false) String keyword) {
		adminService.deleteUser(userId);
		return "redirect:/admin/memberList.do" + (keyword != null ? "?keyword=" + keyword : "");
	}

	// ✅ 퀘스트 목록 (검색 포함)
	@RequestMapping(value = "/questList.do")
	public String showQuestList(@RequestParam(required = false) String keyword, Model model) {
		List<admin_QuestDto> questList = (keyword != null && !keyword.trim().isEmpty())
				? adminService.searchQuests(keyword)
				: adminService.getAllQuests();

		// ✅ 퀘스트 통계 정보 가져오기
		int totalQuestCount = adminService.getTotalQuestCount();
		int progressCount = adminService.countQuestByStatus("진행중");
		int doneCount = adminService.countQuestByStatus("완료");
		int recentCount = adminService.countRecentQuests();

		// ✅ 모델에 값 전달
		model.addAttribute("questList", questList);
		model.addAttribute("totalQuestCount", totalQuestCount);
		model.addAttribute("progressCount", progressCount);
		model.addAttribute("doneCount", doneCount);
		model.addAttribute("recentCount", recentCount);

		model.addAttribute("page", "admin_questList.jsp");
		return "admin/admin_layout";
	}

	// ✅ 추가: 코인 관리 등 다른 페이지도 이 구조 따라 추가 가능
}
