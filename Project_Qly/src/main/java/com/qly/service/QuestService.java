package com.qly.service;

import java.util.List;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;

public interface QuestService {

	List<QuestDto> getAllQuests();

	public int insertQuest(QuestDto quest, String[] taskList);

	void applyQuest(QuestDto quest);

	QuestDto getQuestById(int questId);

	List<QuestDto> getMyQuestList(int userId);
	
	List<QuestTaskDto> getQuestTasks(int questId);
	
	void updateTaskChecks(int questId, List<Integer> checkedTasks);
	
	
	void deductRewardTokens(int questId);
	
	List<QuestDto> heagualList(int userId);
	
	
}
