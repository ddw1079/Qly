package com.qly.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qly.dto.InquiryDto;
import com.qly.dto.UserDto;
import com.qly.service.InquiryService;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;

	// 1:1 문의 작성 폼
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String showInquiryForm() {
		return "Inquirypage/InquiryMain";
	}

	// 문의 등록 처리
	@RequestMapping(value = "/inquiry2.do", method = RequestMethod.POST)
	public String submitInquiry(@ModelAttribute InquiryDto dto, HttpSession session,
			RedirectAttributes redirectAttributes) {
		UserDto user = (UserDto) session.getAttribute("loginUser");
		if (user == null) {
			return "redirect:/login";
		}
		
		dto.setUserId(user.getUserId());
		
		
		dto.setAnswerStatus("미답변");

		// ✅ 로그 추가
		System.out.println("📌 로그인 유저 ID (세션): " + user.getUserId());
		System.out.println("📌 문의에 설정된 USER_ID: " + dto.getUserId());
		

		if (dto.getAnswerContent() == null || dto.getAnswerContent().trim().isEmpty()) {
			dto.setAnswerContent(dto.getContent());
		}

		inquiryService.saveInquiry(dto);

		redirectAttributes.addFlashAttribute("message", "문의가 성공적으로 등록되었습니다.");
		return "redirect:/inquiry/list";
	}

	// 문의 목록
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String listInquiries(Model model, HttpSession session) {
		UserDto user = (UserDto) session.getAttribute("loginUser");
		List<InquiryDto> inquiries = (user != null) ? inquiryService.getInquiriesByUserId(user.getUserId())
				: inquiryService.getAllInquiries(); // 관리자가 보면 전체 출력 가능
		model.addAttribute("inquiryList", inquiries);
		return "Inquirypage/InquiryMain";
	}

	// 문의 상세
	// ✔ 올바르게 수정
	// ✔ 올바르게 수정
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String viewInquiry(@PathVariable("id") int questionId, Model model) {
		InquiryDto inquiry = inquiryService.getInquiryById(questionId);
		model.addAttribute("inquiry", inquiry);
		return "Inquirypage/inquiryDetail";
	}

}
