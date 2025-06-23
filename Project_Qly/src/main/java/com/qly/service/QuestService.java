package com.qly.service;

import java.util.List;

import com.qly.dto.QuestDto;

public interface QuestService {

	List<QuestDto> getAllQuests();

	public int insertQuest(QuestDto quest, String[] taskList);

	void applyQuest(QuestDto quest);

	QuestDto getQuestById(int questId);

	void updateTokens(int userId, int newTokens);

}
