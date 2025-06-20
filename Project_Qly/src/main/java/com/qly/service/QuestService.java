package com.qly.service;

import java.util.List;


import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;

public interface QuestService {

	List<QuestDto> getAllQuests();


	void insertQuest(QuestDto quest, String[] taskList);

}
