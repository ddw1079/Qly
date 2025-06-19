package com.qly.mapper;
import org.apache.ibatis.annotations.Param;
import com.qly.dto.UserDto;

public interface UserMapper {
    UserDto login(@Param("username") String username, @Param("password") String password ); // DTo로 유저 네임과 타입을 반환하고 
    																					// @Param으로 유저 네임과 패스워드 sql로 접근#{}
    UserDto getUser(@Param("username") UserDto dto);
}
