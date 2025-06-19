package com.qly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qly.dto.InquiryDto;
import com.qly.service.InquiryService;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

    @Autowired
    private InquiryService inquiryService;

    // 문의 등록 보기
    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String showInquiryForm() {
        return "inquiryForm"; // /WEB-INF/views/inquiryForm.jsp
    }

    // 문의 등록 처리
    @RequestMapping(method = RequestMethod.POST)
    public String submitInquiry(@ModelAttribute InquiryDto dto) {
        inquiryService.saveInquiry(dto);
        return "redirect:/inquiry/list";
    }

    // 문의 목록 보기
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listInquiries(Model model) {
        List<InquiryDto> inquiries = inquiryService.getAllInquiries();
        model.addAttribute("inquiries", inquiries);
        return "inquiryList"; 
    }

    // 문의 상세 보기
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String viewInquiry(@PathVariable int id, Model model) {
        InquiryDto inquiry = inquiryService.getInquiryById(id);
        model.addAttribute("inquiry", inquiry);
        return "inquiryDetail"; // /WEB-INF/views/inquiryDetail.jsp
    }
}
