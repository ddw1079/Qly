package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.dto.UserDto;
import com.qly.dto.AdminQuestDto;
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
	public List<AdminQuestDto> searchQuests(String keyword) {
		return adminMapper.searchQuests(keyword);
	}

	// 전체 퀘스트 조회
	public List<AdminQuestDto> getAllQuests() {
		return adminMapper.getAllQuests();
	}

	// 전체 회원 수 조회
	public int getTotalUserCount() {
		return adminMapper.countAllUsers();
	}

	// 전체 퀘스트 수 조회
	public int getTotalQuestCount() {
		return adminMapper.countAllQuests();
	}

	// 진행상태별 퀘스트 수 조회
	public int countQuestByStatus(String status) {
		return adminMapper.countQuestByStatus(status);
	}
	
	// 최근 7일 내 등록된 퀘스트 수 조회
	public int countRecentQuests() {
		return adminMapper.countRecentQuests();
	}

}
