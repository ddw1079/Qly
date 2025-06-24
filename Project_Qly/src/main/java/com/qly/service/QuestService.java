package com.qly.service;

import java.util.List;

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

	
	// 메인페이지에서 사용할 메소드
	List<QuestDto> getLatest5Quests();
	List<QuestDto> getRandom3Quests();

}
