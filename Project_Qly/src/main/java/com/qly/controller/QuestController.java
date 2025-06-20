package com.qly.controller;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.dto.UserDto;
import com.qly.service.QlyService;
import com.qly.service.QuestService;
import com.qly.util.GeoUtil;

@Controller
@RequestMapping("/quest")
public class QuestController {

	@Autowired
	private QuestService questService;

	@Autowired
	private QlyService qlyService;
	
	//암호화용 Bean
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;


	@RequestMapping(value = "/list.do")
	public String questList(Model model) {
		List<QuestDto> questList = questService.getAllQuests();

		System.out.println("questList size: " + questList.size());

		model.addAttribute("questList", questList);
		return "quest/QuestAllList";
	}


	@RequestMapping("/registerForm.do")
	public String showQuestRegisterForm() {
		return "quest/QuestRegistration";
	}

	@RequestMapping(value = "/insert.do")
	public String insertQuest(HttpSession session, // 세션으로 로그인 정보 받음!
			@RequestParam("title") String title, @RequestParam("category") String category,
			@RequestParam("taskList") String[] taskList,
			@RequestParam(value = "photo", required = false) MultipartFile photo,
			@RequestParam("content") String content, @RequestParam("startDate") String startDateStr,
			@RequestParam("endDate") String endDateStr, @RequestParam("address") String address,
			@RequestParam("location") String location, @RequestParam("rewardTokens") int rewardTokens,
			HttpServletRequest request) throws Exception {

		System.out.println("title: " + title);
		System.out.println("category: " + category);
		System.out.println("content: " + content);
		System.out.println("startDate: " + startDateStr);
		System.out.println("endDate: " + endDateStr);
		System.out.println("address: " + address);
		System.out.println("location: " + location);
		System.out.println("rewardTokens: " + rewardTokens);
		System.out.println("taskList: " + Arrays.toString(taskList));
		System.out.println("photo: " + (photo != null ? photo.getOriginalFilename() : "없음"));

		// 1. 로그인 유저 정보 세션에서 꺼내기
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null) {
			throw new IllegalStateException("로그인 정보가 없습니다.");
		}

		// int userId = loginUser.getUserId();
		int userId = 12; // 임시

		// 2. 파일 업로드 처리
		String photoPath = null;
		String uploadDir = null;

		if (photo != null && !photo.isEmpty()) {
			// 외부 경로로 지정 (E:\images)
			uploadDir = "E:\\images\\";

			File dir = new File(uploadDir);
			if (!dir.exists())
				dir.mkdirs();

			String fileName = UUID.randomUUID().toString() + "_" + photo.getOriginalFilename();
			File dest = new File(dir, fileName);
			photo.transferTo(dest);

			// 웹에서 접근할 상대 경로 (DB에 저장되는 값)
			photoPath = "/images/" + fileName;
		}

		// 3. 날짜 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = sdf.parse(startDateStr);
		Date endDate = sdf.parse(endDateStr);

		// 4. DTO 생성 및 값 세팅
		QuestDto quest = new QuestDto();
		quest.setUserId(userId); // 세션에서 꺼낸 userId
		quest.setTitle(title);
		quest.setPhotoPath(photoPath);
		quest.setAddress(address);
		quest.setLocation(location);

		try {
			String fullAddress = address + " " + location;
			double[] latLng = GeoUtil.getLatLngFromAddress(fullAddress);
			if (latLng != null) {
				quest.setLatitude(latLng[0]);
				quest.setLongitude(latLng[1]);
				System.out.println("📍 위도/경도 설정 성공: " + latLng[0] + ", " + latLng[1]);
			} else {
				System.out.println("❗ 위도/경도 찾기 실패: " + fullAddress);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("❗ 위도/경도 변환 중 예외 발생");
		}

		quest.setCategory(category);
		quest.setRewardTokens(rewardTokens);
		quest.setStartDate(startDate);
		quest.setEndDate(endDate);
		quest.setContent(content);

		// 필요한 필드 추가로 세팅

		// 6. 서비스 호출
		questService.insertQuest(quest, taskList);

		// 7. 결과 페이지로 이동
		return "redirect:/quest/list.do";
	}



	
	 @RequestMapping("/listForm.do") public String showQuestListPage() { return
	 "quest/QuestAllList"; }
	 
	
	 
	 @RequestMapping("/particularForm.do") public String showQuestParticularForm()
	 { return "quest/QuestParticular"; }
	 

	 @RequestMapping("/Qly_insert.do")
	 public String insertUser(UserDto dto) throws Exception {
	     // 1. 입력된 평문 비밀번호 가져오기
	     String rawPw = dto.getPassword();

	     // 2. 암호화 (해싱) 처리
	     String encodedPw = passwordEncoder.encode(rawPw);

	     // 3. 암호화된 비밀번호로 교체
	     dto.setPassword(encodedPw);

	     // 4. 저장
	     qlyService.insertUser(dto);// 서비스 → DAO → MyBatis 호출

	     return "quest/QuestAllList";
	 }

	
	@RequestMapping("/quest_history.do")
	public String questHistory(@RequestParam("userId") int userId, Model model) {
	    List<QuestTaskDto> questlist = qlyService.getQuestUserId(userId);

	    // 퀘스트별 할 일 목록 Map 생성
	    Map<Integer, List<QuestTaskDto>> taskMap = new HashMap<Integer, List<QuestTaskDto>>();
	    for (QuestTaskDto q : questlist) {
	        taskMap.put(q.getQuestId(), qlyService.getTasksQuestId(q.getQuestId()));
	    }

	    model.addAttribute("questlist", questlist);
	    model.addAttribute("taskMap", taskMap);
	    return "mypage/questHistory";
	}

	

}