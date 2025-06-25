package com.qly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.dto.UserDto;
import com.qly.service.QlyService;
import com.qly.service.QuestService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private QlyService qlyService;

	@Autowired
	private QuestService questService;

	@RequestMapping("/user.do")
	public String goUserLayout(HttpSession session, Model model) {
		// 로그인된 사용자의 세션에서 정보 확인
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/login/loginForm"; // 로그인 안되어 있으면 로그인 페이지로 이동
		}

		// 사용자 ID로 DB에서 추가 정보 조회 가능 (주석처리됨)
		/*
		 * UserDto userInfo = qlyService.getUserById(loginUser.getUserId());
		 * model.addAttribute("userInfo", userInfo); // JSP에 사용자 정보 전달
		 */

		// 마이페이지 레이아웃으로 이동
		return "/mypage/propile_Quest/user_layout";
	}

	@RequestMapping("/sujeug.do")
	public String suJenug(HttpServletRequest request) {
		String pageParam = "mypage/contents/edit_personal_info.jsp";
		request.setAttribute("pageParam", pageParam);
		return "/mypage/propile_Quest/user_layout";
	}

	@RequestMapping("/questcard.do")
	public String questCard(HttpServletRequest request, Model model, HttpSession session) {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		int userId = loginUser.getUserId();
		// List<QuestDto> questList = questService.getAllQuests();
		List<QuestDto> questList = questService.getMyQuestList(userId);
		model.addAttribute("questList", questList);

		String pageParam = "mypage/propile_Quest/questCard.jsp";
		request.setAttribute("pageParam", pageParam);

		return "/mypage/propile_Quest/user_layout";
	}

	@RequestMapping("/heagualquestcard.do")
	public String heagualquestCard(HttpServletRequest request, Model model, HttpSession session) {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		int userId = loginUser.getUserId();
		List<QuestDto> completedQuests = questService.heagualList(userId);
		model.addAttribute("completedQuests", completedQuests);
		for (QuestDto q : completedQuests) {
			System.out.println(q.getTitle() + " / " + q.getCategory() + " / " + q.getRegDate());
		}

		String pageParam = "mypage/propile_Quest/heagual_questCard.jsp";
		request.setAttribute("pageParam", pageParam);

		return "/mypage/propile_Quest/user_layout";
	}

	@RequestMapping("/questhistory.do")
	public String showQuestProgress(Model model, HttpSession session, HttpServletRequest request) {
		// 1. 로그인된 사용자 정보 확인
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		int userId = loginUser.getUserId();

		// 2. 사용자의 퀘스트 목록 조회
		List<QuestDto> questList = questService.getMyProgressQuestList(userId);

		// 3. 퀘스트에 연결된 Task 목록 조회 (Map<퀘스트ID, Task 리스트>)
		Map<Integer, List<QuestTaskDto>> taskMap = new HashMap<>();
		for (QuestDto q : questList) {
			List<QuestTaskDto> taskList = questService.getQuestTasks(q.getQuestId());
			System.out.println(">>> questId 확인: " + q.getQuestId());
			System.out.println("퀘스트 ID: " + q.getQuestId() + ", 할 일 개수: " + taskList.size());
			taskMap.put(q.getQuestId(), taskList);
		}

		// 4. JSP로 전달
		model.addAttribute("questlist", questList);
		model.addAttribute("taskMap", taskMap);
		String pageParam = "mypage/propile_Quest/questHistory.jsp";
		request.setAttribute("pageParam", pageParam);

		return "/mypage/propile_Quest/user_layout"; // 레이아웃 JSP
	}

	@RequestMapping("/questcompleted.do")
	public String showCompletedQuests(HttpSession session, Model model, HttpServletRequest request) {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/user/loginForm.do";
		}

		int userId = loginUser.getUserId();
		List<QuestDto> completedQuests = questService.getCompletedQuestsByUserId(userId);
		model.addAttribute("completedQuests", completedQuests);

		String pageParam = "mypage/propile_Quest/quest_completed.jsp";
		request.setAttribute("pageParam", pageParam);

		return "/mypage/propile_Quest/user_layout";
	}

	@RequestMapping("/insertcheck.do")
	public String insertCheck(@RequestParam("questId") int questId,
			@RequestParam(value = "checkedTasks", required = false) List<Integer> checkedTasks, HttpSession session) {

		if (checkedTasks == null) {
			checkedTasks = new ArrayList<>();
		}

		// 1. 체크 상태 업데이트
		questService.updateTaskChecks(questId, checkedTasks);

		// 2. 퀘스트 상태 '완료'로 변경 추가
		questService.updateQuestStatus(questId);

		// 3. 리다이렉트
		return "redirect:/mypage/questhistory.do";
	}

	@RequestMapping(value = "/checkUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateTaskCheck(@RequestParam("taskId") int taskId, @RequestParam("isChecked") boolean isChecked) {
		questService.updateTaskCheckStatus(taskId, isChecked);
		return "success";
	}

	@RequestMapping("/coinpayment.do")
	public String processCoinPayment(@RequestParam("questId") int questId, HttpSession session) {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null)
			return "redirect:/login/loginForm";

		// 보상 토큰 차감 처리 (ex. 100코인)
		questService.deductRewardTokens(questId);

		return "redirect:/mypage/questhistory.do";
	}

	/*
	 * @RequestMapping("/questprogress.do") public String
	 * showQuestProgressCard(@RequestParam("questId") int questId, Model model,
	 * HttpServletRequest request) { // 퀘스트 조회 QuestDto quest =
	 * questService.getQuestById(questId); model.addAttribute("quest", quest);
	 * 
	 * // 퀘스트 태스크 목록 조회 List<QuestTaskDto> taskList =
	 * questService.getQuestTasksForProgress(questId);
	 * model.addAttribute("taskList", taskList);
	 * 
	 * // 진행률 계산 (문자열 "1"로 비교) int completedCount = (int)
	 * taskList.stream().filter(task -> "1".equals(task.getIsChecked())).count();
	 * int progress = taskList.size() == 0 ? 0 : (completedCount * 100) /
	 * taskList.size();
	 * 
	 * model.addAttribute("progress", progress);
	 * 
	 * String pageParam = "mypage/propile_Quest/heagual_questHistory.jsp";
	 * request.setAttribute("pageParam", pageParam);
	 * 
	 * return "/mypage/propile_Quest/user_layout"; }
	 */

	/*
	 * @RequestMapping("/questprogress.do") public String
	 * showQuestProgressCard(Model model, HttpServletRequest request, HttpSession
	 * session) {
	 * 
	 * // 1. 로그인 확인 UserDto loginUser = (UserDto) session.getAttribute("loginUser");
	 * if (loginUser == null) { System.out.println("로그인 정보 없음"); return
	 * "redirect:/user/login.do"; } int userId = loginUser.getUserId();
	 * 
	 * // 2. 세션에서 questId 꺼내기 Integer questId = (Integer)
	 * session.getAttribute("selectedQuestId"); if (questId == null) {
	 * System.out.println("❌ 세션에 questId가 없습니다."); return
	 * "redirect:/mypage/questhistory.do"; }
	 * System.out.println("✅ 세션에서 questId 가져옴: " + questId);
	 * 
	 * // 3. 해당 유저의 퀘스트 목록에서 questId에 해당하는 퀘스트 찾기 List<QuestDto> questList =
	 * questService.getMyQuestList(userId); QuestDto selectedQuest =
	 * questList.stream().filter(q -> q.getQuestId() ==
	 * questId).findFirst().orElse(null);
	 * 
	 * if (selectedQuest == null) { System.out.println("❌ questId에 해당하는 퀘스트가 없음!");
	 * return "redirect:/mypage/questhistory.do"; }
	 * 
	 * // 4. 퀘스트, 태스크, 진행률 정보 JSP에 전달 model.addAttribute("quest", selectedQuest);
	 * 
	 * List<QuestTaskDto> taskList = questService.getQuestTasksForProgress(questId);
	 * model.addAttribute("taskList", taskList);
	 * 
	 * int completedCount = (int) taskList.stream().filter(task ->
	 * "1".equals(task.getIsChecked())).count(); int progress = taskList.isEmpty() ?
	 * 0 : (completedCount * 100) / taskList.size(); model.addAttribute("progress",
	 * progress);
	 * 
	 * // 5. 페이지 파라미터 설정 request.setAttribute("pageParam",
	 * "mypage/propile_Quest/heagual_questHistory.jsp");
	 * 
	 * return "/mypage/propile_Quest/user_layout"; }
	 */

//	@RequestMapping("/selectQuest.do")
//	public String selectQuest(@RequestParam("questId") int questId, HttpSession session) {
//		session.setAttribute("selectedQuestId", questId);
//		System.out.println(questId);
//		return "redirect:/mypage/questprogress.do";
//	}

	// 예시: 진행상황 리스트 로드하는 컨트롤러
	@RequestMapping("/questprogress.do")
	public String showQuestProgress(HttpSession session, Model model, HttpServletRequest request) {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		int userId = loginUser.getUserId();

		List<QuestDto> questList = questService.getQuestsByApplicantUserId(userId); // 내가 신청한 퀘스트

		Map<Integer, List<QuestTaskDto>> taskMap = new HashMap<>();
		Map<Integer, Integer> progressMap = new HashMap<>();
		Map<Integer, Boolean> rewardGivenMap = new HashMap<>();

		for (QuestDto quest : questList) {
			int questId = quest.getQuestId();

			// 할 일 목록
			List<QuestTaskDto> tasks = questService.getQuestTasks(questId);
			taskMap.put(questId, tasks);

			// 진행률 계산
			long total = tasks.size();
			long completed = tasks.stream().filter(t -> "1".equals(t.getIsChecked())).count();
			int progress = (total == 0) ? 0 : (int) ((completed * 100) / total);
			progressMap.put(questId, progress);

			// REWARD_GIVEN 여부 확인
			boolean isGiven = questService.isRewardGiven(questId, userId); // ← 이 메서드가 반드시 필요!
			rewardGivenMap.put(questId, isGiven);
		}

		model.addAttribute("questList", questList);
		model.addAttribute("taskMap", taskMap);
		model.addAttribute("progressMap", progressMap);
		model.addAttribute("rewardGivenMap", rewardGivenMap);

		request.setAttribute("pageParam", "mypage/propile_Quest/heagual_questHistory.jsp");
		return "/mypage/propile_Quest/user_layout";

	}

	// 보상 토큰 차감 처리 (ex. 100토큰)
	// questService.deductRewardTokens(questId);

	@RequestMapping("/giveReward.do")
	public String giveReward(@RequestParam("questId") int questId, HttpSession session,
			RedirectAttributes redirectAttributes) {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null)
			return "redirect:/loginForm.do";

		int userId = loginUser.getUserId();

		// 1. questId로 rewardToken 조회
		int reward = questService.getRewardTokensByQuestId(questId);

		// 2. 유저 total_tokens에 reward 더하기
		qlyService.addTokensUser(userId, reward);

		// ✅ 3. 보상 지급 여부 테이블에 표시 (REWARD_GIVEN = 'Y')
		questService.markRewardGiven(questId, userId);

		// 4. 세션 정보 갱신
		loginUser.setTotalTokens(loginUser.getTotalTokens() + reward);
		session.setAttribute("loginUser", loginUser);

		// 5. 지급 완료 표시용 redirect
		redirectAttributes.addFlashAttribute("rewardGivenQuestId", questId);

		return "redirect:/mypage/questprogress.do";
	}

}
