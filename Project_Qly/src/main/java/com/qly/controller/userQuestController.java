package com.qly.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.service.QuestService;

@Controller
@RequestMapping("/questaa")
public class userQuestController {

	@Autowired
	private QuestService questService;

	/*
	 * @RequestMapping(value = "/list.do") public String
	 * questList(@RequestParam(required = false) String keyword, Model model) {
	 * List<QuestDto> questList;
	 * 
	 * if (keyword != null && !keyword.trim().isEmpty()) { questList =
	 * questService.searchQuests(keyword); } else { questList =
	 * questService.getAllQuests(); }
	 * 
	 * System.out.println("keyword: [" + keyword + "]");
	 * System.out.println("questList size: " + questList.size());
	 * 
	 * model.addAttribute("questList", questList); return "quest/QuestAllList"; }
	 */
	@RequestMapping(value = "/lista.do")
	public String questList(Model model) {
		List<QuestDto> questList = questService.getAllQuests();

		System.out.println("questList size: " + questList.size());

		model.addAttribute("questList", questList);
		return "quest/QuestAllList";
	}

	@RequestMapping(value = "/inserta.do", method = RequestMethod.POST)
	public String insertQuest(@ModelAttribute QuestDto questDto, @RequestParam("photo") MultipartFile photoFile,
			HttpSession session) throws Exception {

		if (!photoFile.isEmpty()) {
			String originalFilename = photoFile.getOriginalFilename();
			String newFilename = UUID.randomUUID() + "_" + originalFilename;

			// 절대 경로로 변경 (윈도우 환경 기준)
			String uploadDir = "E:\\photo";

			File uploadFolder = new File(uploadDir);
			if (!uploadFolder.exists()) {
				uploadFolder.mkdirs(); // 폴더가 없으면 생성
			}

			File saveFile = new File(uploadFolder, newFilename);
			photoFile.transferTo(saveFile);

			questDto.setPhotoPath(newFilename);
		}

		Integer userId = (Integer) session.getAttribute("userId");
		questDto.setUserId(userId);

		List<QuestTaskDto> tasks = questDto.getTasks();

		questService.insertQuest(questDto, tasks);

		return "quest/QuestAllList";
	}

}