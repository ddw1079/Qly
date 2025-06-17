package com.qly.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.qly.dto.QuestDto;
import com.qly.service.QuestService;

@Controller
@RequestMapping("/quest")
public class QuestController {

	@Autowired
	private QuestService questService;

	@RequestMapping(value = "/list.do")
	public String questList(@RequestParam(required = false) String keyword, Model model) {
		List<QuestDto> questList;

		if (keyword != null && !keyword.trim().isEmpty()) {
			questList = questService.searchQuests(keyword);
		} else {
			questList = questService.getAllQuests();
		}

		System.out.println("questList size: " + questList.size()); // 크기 출력

		model.addAttribute("questList", questList);
		return "quest/QuestAllList";
	}

	@RequestMapping(value = "/insert.do")
	public String insertQuest(@ModelAttribute QuestDto quest, @RequestParam("photo") MultipartFile photo) {

		quest.setStatus("대기");
		quest.setUserId(1); // 임시 유저

		if (photo != null && !photo.isEmpty()) {
			String fileName = photo.getOriginalFilename();
			quest.setPhotoPath("/uploads/" + fileName);
		}

		questService.insertQuest(quest);

		return "redirect:/quest/list.do";
	}
	
	
		@RequestMapping("/listForm.do")
		public String showQuestListPage() {
	    return "quest/QuestAllList"; 
		}

	
	   @RequestMapping("/registerForm.do")
	    public String showQuestRegisterForm() {
	        return "quest/QuestRegistration"; 
	    }

	    
	    @RequestMapping("/particularForm.do")
	    public String showQuestParticularForm() {
	        return "quest/QuestParticular"; 
	    }


	

}
