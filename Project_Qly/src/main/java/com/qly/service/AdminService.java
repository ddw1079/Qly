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

    // ��ü ȸ�� ��ȸ
    public List<UserDto> getAllUsers() {
        return adminMapper.findAllUsers();
    }

    // ȸ�� �˻�
    public List<UserDto> searchUsers(String keyword) {
        return adminMapper.searchUsers(keyword);
    }

    // ȸ�� ����
    public void deleteUser(String userId) {
        adminMapper.deleteUser(userId);
    }

    // ����Ʈ �˻�
    public List<QuestDto> searchQuests(String keyword) {
        return adminMapper.searchQuests(keyword);
    }

    // ��ü ����Ʈ ��ȸ
    public List<QuestDto> getAllQuests() {
        return adminMapper.getAllQuests();
    }

    // ��ü ȸ�� �� ��ȸ
    public int getTotalUserCount() {
        return adminMapper.countAllUsers();
    }

}
