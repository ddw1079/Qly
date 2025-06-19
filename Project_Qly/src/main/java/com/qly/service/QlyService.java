package com.qly.service;

import java.util.List;

import com.qly.dto.QuestTaskDto;
import com.qly.dto.UserDto;

public interface QlyService {
	
	void insertUser(UserDto dto)throws Exception;

	UserDto login(String username, String password);
	
	List<QuestTaskDto> getTasksQuestId(int questid);
	List<QuestTaskDto> getQuestUserId(int userid);

}
