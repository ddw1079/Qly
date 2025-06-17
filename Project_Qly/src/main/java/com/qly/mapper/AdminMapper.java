package com.qly.mapper;

import com.qly.dto.QuestDto;
import com.qly.dto.UserDto;
import java.util.List;

public interface AdminMapper {

    // 전체 회원 조회
    List<UserDto> findAllUsers();

    // 아이디 또는 닉네임 검색
    List<UserDto> searchUsers(String keyword);

    // 회원 삭제
    void deleteUser(String userId);

    // 퀘스트 전체 조회
    List<QuestDto> getAllQuests();

    // 퀘스트 검색
    List<QuestDto> searchQuests(String keyword);
    
 // 총 회원 수 조회
    int countAllUsers();
}
