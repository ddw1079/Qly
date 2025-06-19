package com.qly.mapper;
import org.apache.ibatis.annotations.Param;
import com.qly.dto.UserDto;

public interface UserMapper {
    UserDto login(@Param("username") String username, @Param("password") String password ); // DTo�� ���� ���Ӱ� Ÿ���� ��ȯ�ϰ� 
    																					// @Param���� ���� ���Ӱ� �н����� sql�� ����#{}
    UserDto getUser(@Param("username") UserDto dto);
}
