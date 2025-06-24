package com.qly.service;

import java.util.List;
import java.util.Map;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;

public interface QuestService {

	List<QuestDto> getAllQuests();

	public int insertQuest(QuestDto quest, String[] taskList);

	void applyQuest(QuestDto quest);

	QuestDto getQuestById(int questId);


	void updateTokens(int userId, int newTokens);


	List<QuestDto> getMyQuestList(int userId);
	
	List<QuestTaskDto> getQuestTasks(int questId);
	
	void updateTaskChecks(int questId, List<Integer> checkedTasks);
	
	void deductRewardTokens(int questId);

	List<QuestTaskDto> jongilJJangyoonjaeJJang(int questId);
	
	List<QuestDto> getQuestsByApplicantUserId(int userId);

	List<QuestDto> heagualList(int userId);
	
	void updateQuestStatus(int questId);
	
	int getRewardTokensByQuestId(int questId); // QUESTS에서 rewardTokens 조회
	
	void markRewardGiven(int questId, int userId); //상태 표시 해결퀘스트히스토리
	
	boolean isRewardGiven(int questId, int userId); // 보상지급여부
	
	void updateTaskCheckStatus(int taskId, boolean isChecked); // ajex 체크박스




	List<QuestDto> getApplicantsByQuestId(int questId);

	void assignSolver(int questId, int userId);

	Map<Integer, List<QuestTaskDto>> getTasksForQuests(List<QuestDto> progressQuests);

	// List<QuestDto> getInProgressQuestsByUserId(int userId);

	
	// 메인페이지에서 사용할 메소드
	List<QuestDto> getLatest5Quests();
	List<QuestDto> getRandom3Quests();
	List<String> searchCategories(String keyword);

}
