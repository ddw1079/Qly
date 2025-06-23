package com.qly.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.dto.UserDto;
import com.qly.service.QlyService;
import com.qly.service.QuestService;
import com.qly.util.CloudinaryUploader;
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
		model.addAttribute("questList", questList);

		return "quest/QuestAllList";
	}

	// 등록
	@RequestMapping("/registerForm.do")
	public String showQuestRegisterForm(HttpSession session, RedirectAttributes redirectAttr) {

		UserDto loginUser = (UserDto) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/user/login.do";
		}

		if ("해결사".equals(loginUser.getUserType())) {
			redirectAttr.addFlashAttribute("error", "의뢰자만 등록 가능합니다.");
			return "redirect:/mainpage";
		}

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
			System.out.println("로그인 정보 없음");
			return "redirect:/user/login.do";
		}
		int userId = loginUser.getUserId();
		System.out.println(userId);
		System.out.println("로그인 유저 확인: " + loginUser);
		System.out.println("userId: " + loginUser.getUserId());

		// 2. 이미지 업로드 처리 (Cloudinary 사용)
		String photoPath = null;

		if (photo != null && !photo.isEmpty()) {
			try {
				CloudinaryUploader uploader = new CloudinaryUploader();
				photoPath = uploader.upload(photo); // Cloudinary에 업로드
				System.out.println("업로드된 이미지 URL: " + photoPath);
			} catch (Exception e) {
				System.out.println("Cloudinary 업로드 실패: " + e.getMessage());
				e.printStackTrace();
			}
		}

		// 3. 날짜 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = sdf.parse(startDateStr);
		Date endDate = sdf.parse(endDateStr);

		// 4. DTO 생성 및 값 세팅
		QuestDto quest = new QuestDto();
		UserDto user = new UserDto();
		user.setUserId(userId); // 세션에서 꺼낸 userId
		quest.setUserId(userId);
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

		// 🔸 현재 유저의 토큰 확인
		int currentTokens = loginUser.getTotalTokens();

		// 🔸 보유 코인보다 많으면 차단
		if (rewardTokens > currentTokens) {
			System.out.println("코인이 부족합니다.");
			request.setAttribute("error", "코인이 부족합니다.");
			return "quest/insertForm"; // 또는 오류 페이지
		}

		// 🔸 토큰 차감
		int newTokens = currentTokens - rewardTokens;
		questService.updateTokens(userId, newTokens); // 실제 DB 업데이트

		// 🔸 세션도 반영
		loginUser.setTotalTokens(newTokens);
		session.setAttribute("loginUser", loginUser);

		// 필요한 필드 추가로 세팅
		int questId = questService.insertQuest(quest, taskList);

		session.setAttribute("QuestId", questId);

		// 7. 결과 페이지로 이동
		// return "redirect:/quest/list.do?questId=" + questId;
		// return "redirect:/quest/particularForm.do?questId=" + questId;
		return "mainpage";
	}

	@RequestMapping("/particularForm.do")
	public String showQuestparticularForm(@RequestParam("questId") int questId, HttpSession session, Model model) {
		System.out.println("전달받은 questId = " + questId);

		QuestDto quest = questService.getQuestById(questId);
		System.out.println("photoPath: " + quest.getPhotoPath());

		/*
		 * if (quest == null) { System.out.println("❗ 해당 퀘스트 없음"); return
		 * "redirect:/quest/list.do"; }
		 */

		model.addAttribute("quest", quest);

		return "quest/QuestParticular";
	}

	@RequestMapping("/application.do")
	public String applyQuest(@RequestParam("questId") int questId, @RequestParam("day") String day,
			@RequestParam("time") String time, HttpSession session, Model model, RedirectAttributes redirectAttr)
			throws Exception {

		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("로그인 정보 없음");
			return "redirect:/user/login.do";
		}

		if (!"해결사".equals(loginUser.getUserType())) {
			redirectAttr.addFlashAttribute("error", "해결사만 퀘스트를 신청할 수 있습니다.");
			redirectAttr.addAttribute("questId", questId);
			return "redirect:/quest/particularForm.do";
		}

		System.out.println("userId: " + loginUser.getUserId());
		System.out.println("questId: " + questId);
		System.out.println("day: " + day);
		System.out.println("time: " + time);

		String datetimeStr = day + " " + time;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date appliedAt = sdf.parse(datetimeStr);

		QuestDto dto = new QuestDto();
		dto.setQuestId(questId);
		dto.setUserId(loginUser.getUserId());
		dto.setStatus("대기");
		dto.setAppliedAt(appliedAt);

		questService.applyQuest(dto);
		model.addAttribute("loginUser", loginUser);

		QuestDto quest = questService.getQuestById(questId);
		System.out.println("photoPath: " + quest.getPhotoPath());

		return "mainpage";
	}

	@RequestMapping("/listForm.do")
	public String showQuestListPage() {
		return "quest/QuestAllList";
	}


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