package com.qly.service;

import com.qly.dto.QuestDto;
import com.qly.dto.UserDto;
import com.qly.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public List<QuestDto> searchQuests(String keyword) {
        return adminMapper.searchQuests(keyword);
    }

    // 전체 퀘스트 조회
    public List<QuestDto> getAllQuests() {
        return adminMapper.getAllQuests();
    }

    // 전체 회원 수 조회
    public int getTotalUserCount() {
        return adminMapper.countAllUsers();
    }

}
