package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.dto.QuestTaskDto;
import com.qly.dto.UserDto;
import com.qly.mapper.QuestMapper;
import com.qly.mapper.UserMapper;

@Service("qlyService")
public class QlyServiceImpl implements QlyService {

	@Autowired
	private QuestMapper questMapper;

	@Autowired
	private UserMapper userMapper;

	@Override
	public void insertUser(UserDto dto) throws Exception {
		questMapper.insertUser(dto);
	}

	@Override
	public UserDto getUserByUsername(String username) {
		return questMapper.getUserByUsername(username); 
	}

	@Override
	public UserDto login(String username) {
		return userMapper.login(username);
	}

	@Override
	public List<QuestTaskDto> getTasksQuestId(int questid) {
		return questMapper.getTasksQuestId(questid);
	}

	@Override
	public List<QuestTaskDto> getQuestUserId(int userId) {
		return questMapper.getQuestUserId(userId);
	}

	/*
	 * @Override public UserDto getUserById(int userId) { return
	 * userMapper.selectUserById(userId); }
	 */


    @Override
    public UserDto getUserById(int userId) {
        return userMapper.selectUserById(userId);
    }
    @Override
    public void addTokensUser(int userId, int rewardTokens) {
    	userMapper.addTokensUser(userId,rewardTokens);
    }
    

}
