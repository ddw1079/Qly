package com.qly.mapper;

import org.apache.ibatis.annotations.Param;
import com.qly.dto.UserDto;

public interface UserMapper {

    // username으로 사용자 정보 조회 
    UserDto login(@Param("username") String username);

    // userId로 사용자 정보 조회
    UserDto selectUserById(@Param("userId") int userId);
}
