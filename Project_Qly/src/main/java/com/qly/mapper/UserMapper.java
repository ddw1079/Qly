package com.qly.mapper;

import org.apache.ibatis.annotations.Param;
import com.qly.dto.UserDto;

public interface UserMapper {
    UserDto login(@Param("username") String username, @Param("password") String password);
    UserDto selectUserById(@Param("userId") int userId);
}
