package com.qly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.dto.UserDto;
import com.qly.mapper.UserMapper;

@Service("qlyService")
public class QlyServiceImpl implements QlyService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void insertUser(UserDto dto) throws Exception {
        userMapper.insertUser(dto);
    }

    @Override
    public UserDto login(UserDto dto) {
        return userMapper.login(dto); // UserDto °´Ã¼ ±×´ë·Î ³Ñ±è
    }
}
