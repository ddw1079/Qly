package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.dto.UserDto;
import com.qly.mapper.QuestMapper;
import com.qly.mapper.UserMapper;

@Service("qlyService")
public class QlyServiceImpl implements QlyService{
	
	@Autowired
    private QuestMapper questMapper;
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public void insertUser(UserDto dto) throws Exception {
		// TODO Auto-generated method stub
		questMapper.insertUser(dto);
		
	}
	  @Override
	    public UserDto login(String username, String password) {
	        return userMapper.login(username, password);
	    }
	  @Override
	  public List<QuestTaskDto> getTasksQuestId(int questid){
		  return questMapper.getTasksQuestId(questid);
	  }
	  @Override
	  public List<QuestDto> getQuestUserId(int userId){
		  return questMapper.getQuestUserId(userId);
	  }
	  
	  @Override
	  public UserDto getUser(UserDto dto) {
		  return userMapper.getUser(dto);
	  }
	  

}
