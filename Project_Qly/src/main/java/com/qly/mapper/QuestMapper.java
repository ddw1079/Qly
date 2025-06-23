package com.qly.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.dto.UserDto;

public interface QuestMapper {

	// �쟾泥� �섏뒪�듃 由ъ뒪�듃 議고쉶
	List<QuestDto> getAllQuests();

	void insertQuest(QuestDto quest);

	void insertQuestTask(QuestTaskDto task);

	// �궎�썙�뱶濡� �섏뒪�듃 寃��깋
	List<QuestDto> searchQuests(String keyword);

	void insertUser(UserDto dto);

	List<QuestTaskDto> getTasksQuestId(int questid);

	List<QuestTaskDto> getQuestUserId(int userId);

	// �떊泥�
	void insertQuestApplication(QuestDto quest);

	QuestDto selectQuestById(int questId);

	QuestDto QuestById(int questId);
	
	List<QuestDto> getMyQuestList(int userId);
	
	List<QuestTaskDto> getQuestTasks(int questId);
	
	void resetAllTaskChecks(@Param("questId") int questId);

	void setCheckedTasks(@Param("taskIds") List<Integer> taskIds);
	
	void reduceTokensBy100(@Param("questId") int questId);

	

}
