package com.qly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.dto.UserDto;
import com.qly.mapper.UserMapper;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    // �α��� �޼���
    public UserDto login(String username, String password) {
        return userMapper.login(username, password);
    }
}
