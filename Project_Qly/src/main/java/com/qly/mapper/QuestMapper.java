package com.qly.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

	List<QuestTaskDto> getQuestUserId(int userId);

	// 신청
	void insertQuestApplication(QuestDto quest);

	QuestDto selectQuestById(int questId);

	QuestDto QuestById(int questId);
	
	void updateUserTokens(@Param("userId") int userId, @Param("totalTokens") int totalTokens);

}
