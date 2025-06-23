
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

	// ✅ 1:1 문의 작성 폼 (GET)
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String showInquiryForm() {
		return "Inquirypage/InquiryMain";
	}

	// ✅ 문의 등록 처리 (POST)
	@RequestMapping(value = "/inquiry2.do", method = RequestMethod.POST)
	public String submitInquiry(@ModelAttribute InquiryDto dto, HttpSession session,
	                            RedirectAttributes redirectAttributes) {
	    UserDto user = (UserDto) session.getAttribute("loginUser");
	    if (user == null) {
	        return "redirect:/login";
	    }

	    dto.setUserId(user.getUserId());
	    dto.setAnswerStatus("미답변"); // 무조건 기본값

	    inquiryService.saveInquiry(dto);
	    redirectAttributes.addFlashAttribute("message", "문의가 성공적으로 등록되었습니다.");
	    return "redirect:/inquiry/list.do";
	}



	// ✅ 문의 목록 조회 (GET)
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String listInquiries(Model model, HttpSession session) {
		UserDto user = (UserDto) session.getAttribute("loginUser");
		List<InquiryDto> inquiries = (user != null)
				? inquiryService.getInquiriesByUserId(user.getUserId())
				: inquiryService.getAllInquiries();
System.out.println(inquiries);
		model.addAttribute("inquiryList", inquiries);
		return "Inquirypage/InquiryMain";
	}

	// ✅ 문의 상세 보기 (GET)
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String viewInquiry(@PathVariable("id") int questionId, Model model) {
		InquiryDto inquiry = inquiryService.getInquiryById(questionId);
		model.addAttribute("inquiry", inquiry);
		return "Inquirypage/inquiryDetail";
	}
	
	
}
