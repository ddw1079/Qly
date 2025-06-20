package com.qly.mapper;


import java.util.List;

import com.qly.dto.QuestTaskDto;


public interface QuestTaskMapper {

	void insertQuestTask(QuestTaskDto questTask);
	
	List<QuestTaskDto> getTasksByQuestId(int questId);

}
