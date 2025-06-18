package com.qly.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.qly.dto.QuestDto;
import com.qly.dto.UserDto;
import com.qly.service.QlyService;
import com.qly.service.QuestService;

@Controller
@RequestMapping("/quest")
public class QuestController {

	@Autowired
	private QuestService questService;

	@Autowired
	private QlyService qlyService;

	@RequestMapping(value = "/list.do")
	public String questList(Model model) {
		List<QuestDto> questList = questService.getAllQuests();

		System.out.println("questList size: " + questList.size());

		model.addAttribute("questList", questList);
		return "quest/QuestAllList";
	}

	/*
	 * @RequestMapping(value = "/insert.do") public String
	 * insertQuest(@ModelAttribute QuestDto quest,
	 * 
	 * @RequestParam("photo") MultipartFile photo, HttpServletRequest request) {
	 * 
	 * // 파일 업로드 처리 (간단 예시) if (!photo.isEmpty()) { String uploadDir =
	 * request.getSession().getServletContext().getRealPath("/upload/"); File dir =
	 * new File(uploadDir); if (!dir.exists()) dir.mkdirs();
	 * 
	 * String fileName = photo.getOriginalFilename(); try { photo.transferTo(new
	 * File(uploadDir + fileName)); quest.setPhotoPath("/upload/" + fileName); }
	 * catch (IOException e) { e.printStackTrace(); } }
	 * 
	 * questService.registerQuest(quest); return "quest/QuestAllList"; }
	 */

	// GET: 퀘스트 등록 폼 보여주기
	@RequestMapping(value = "/insert.do", method = RequestMethod.GET)
	public String showInsertForm() {
		// views/quest/insertForm.jsp 가 있다고 가정
		return "quest/QuestRegistration";
	}

	// POST: 퀘스트 등록 처리
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String insertQuest(@ModelAttribute QuestDto quest, 
							  @RequestParam("photo") MultipartFile photo,
							  HttpServletRequest request) {

		if (!photo.isEmpty()) {
			String uploadDir = request.getSession().getServletContext().getRealPath("/upload/");
			File dir = new File(uploadDir);
			if (!dir.exists())
				dir.mkdirs();

			String fileName = photo.getOriginalFilename();
			try {
				photo.transferTo(new File(uploadDir + fileName));
				quest.setPhotoPath("/upload/" + fileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		quest.setUserId(2);
		questService.registerQuest(quest);

		// 등록 후 퀘스트 리스트 페이지로 리다이렉트
		return "redirect:/list.do";
	}

	@RequestMapping("/Qly_insert.do")
	public String insertUser(UserDto dto) throws Exception {
		qlyService.insertUser(dto); // 서비스 → DAO → MyBatis 호출
		return "quest/QuestAllList";
	}

}