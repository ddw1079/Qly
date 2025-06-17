package com.qly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.dto.UserDto;
import com.qly.mapper.QuestMapper;

@Service("qlyService")
public class QlyServiceImpl implements QlyService{
	
	@Autowired
    private QuestMapper questMapper;

	@Override
	public void insertUser(UserDto dto) throws Exception {
		// TODO Auto-generated method stub
		questMapper.insertUser(dto);
		
	}

}
