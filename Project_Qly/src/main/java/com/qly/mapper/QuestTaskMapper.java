package com.qly.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qly.dto.QuestTaskDto;


public interface QuestTaskMapper {

	void insertQuestTask(QuestTaskDto questTask);
	
	List<QuestTaskDto> getTasksByQuestId(int questId);
	
	void updateTaskCheckStatus(@Param("taskId") int taskId, @Param("isChecked") String isChecked);


}
