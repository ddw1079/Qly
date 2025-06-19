package com.qly.mapper;

import java.util.List;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.dto.UserDto;

public interface QuestMapper {

	// 전체 퀘스트 리스트 조회
	List<QuestDto> getAllQuests();

	void insertQuest(QuestDto quest);

	void insertQuestTask(QuestTaskDto task);

	// 키워드로 퀘스트 검색
	List<QuestDto> searchQuests(String keyword);

	void insertUser(UserDto dto);
	
	List<QuestTaskDto> getTasksQuestId(int questid);
	


	List<QuestDto> getQuestUserId(int userId);


}
