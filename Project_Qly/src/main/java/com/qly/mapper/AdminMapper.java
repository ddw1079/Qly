package com.qly.mapper;

import com.qly.dto.UserDto;
import com.qly.dto.admin_QuestDto;

import java.util.List;

public interface AdminMapper {

    // 전체 회원 조회
    List<UserDto> findAllUsers();

    // 아이디 또는 닉네임 검색
    List<UserDto> searchUsers(String keyword);

    // 회원 삭제
    void deleteUser(String userId);

    // ✅ 퀘스트 전체 목록 (admin_QuestDto 기준)
    List<admin_QuestDto> getAllQuests();

    // ✅ 퀘스트 검색도 admin_QuestDto 기준으로 통일
    List<admin_QuestDto> searchQuests(String keyword);

    // 전체 회원 수 조회
    int countAllUsers();
}
