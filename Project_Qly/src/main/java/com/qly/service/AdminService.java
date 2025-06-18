package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.dto.UserDto;
import com.qly.dto.admin_QuestDto; // 추가 필요
import com.qly.mapper.AdminMapper;

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    // 전체 회원 조회
    public List<UserDto> getAllUsers() {
        return adminMapper.findAllUsers();
    }

    // 회원 검색
    public List<UserDto> searchUsers(String keyword) {
        return adminMapper.searchUsers(keyword);
    }

    // 회원 삭제
    public void deleteUser(String userId) {
        adminMapper.deleteUser(userId);
    }

    // 퀘스트 검색
    public List<admin_QuestDto> searchQuests(String keyword) {
        return (List<admin_QuestDto>) adminMapper.searchQuests(keyword);
    }

    // ✅ 전체 퀘스트 조회
    public List<admin_QuestDto> getAllQuests() {
        return adminMapper.getAllQuests();
    }

    // 전체 회원 수 조회
    public int getTotalUserCount() {
        return adminMapper.countAllUsers();
    }

}
