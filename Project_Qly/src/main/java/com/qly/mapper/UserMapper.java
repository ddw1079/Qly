package com.qly.mapper;

import org.apache.ibatis.annotations.Param;
import com.qly.dto.UserDto;

public interface UserMapper {

    
	
	// UserDto selectUserById(@Param("userId") int userId);

    UserDto login(@Param("username") String username);
    UserDto selectUserById(@Param("userId") int userId);
    
    
    void addTokensUser(@Param("userId") int userId, @Param("amount") int amount);


}
