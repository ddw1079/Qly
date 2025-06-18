package com.qly.service;

import com.qly.dto.UserDto;

public interface QlyService {

    void insertUser(UserDto dto) throws Exception;

    UserDto login(String userid, String password); 
}
