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

	// �쟾泥� �쉶�썝 議고쉶
	public List<UserDto> getAllUsers() {
		return adminMapper.findAllUsers();
	}

	// �쉶�썝 寃��깋
	public List<UserDto> searchUsers(String keyword) {
		return adminMapper.searchUsers(keyword);
	}

	// �쉶�썝 �궘�젣
	public void deleteUser(String userId) {
		adminMapper.deleteUser(userId);
	}

	// �섏뒪�듃 寃��깋
	public List<QuestDto> searchQuests(String keyword) {
	    return adminMapper.searchQuests(keyword);
	}
	
	// �쟾泥� �섏뒪�듃 議고쉶
	public List<QuestDto> getAllQuests() {
	    return adminMapper.getAllQuests();
	}

	// 🔹 총 회원 수 조회
	public int getTotalUserCount() {
	    return adminMapper.countAllUsers();
	}
	
}
