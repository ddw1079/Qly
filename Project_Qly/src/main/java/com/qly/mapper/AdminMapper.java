package com.qly.mapper;
// 클래스명 변경: AdminQuestMapper → AdminMapper
//이유: MyBatis 매퍼 XML 파일(AdminMapper.xml)과 이름 일치 필요
//   → Mapper 인터페이스와 XML의 네이밍 일치가 안 되면 매핑 오류 발생


import com.qly.dto.UserDto;
import com.qly.dto.AdminQuestDto;

import java.util.List;

public interface AdminMapper {

	// 전체 회원 조회
	List<UserDto> findAllUsers();

	// 아이디 또는 닉네임 검색
	List<UserDto> searchUsers(String keyword);

	// 회원 삭제
	void deleteUser(String userId);

	// ✅ 퀘스트 전체 목록 (admin_QuestDto 기준)
	List<AdminQuestDto> getAllQuests();

	// ✅ 퀘스트 검색도 admin_QuestDto 기준으로 통일
	List<AdminQuestDto> searchQuests(String keyword);

	// 전체 회원 수 조회
	int countAllUsers();

	// 전체 퀘스트 수 조회
	int countAllQuests();

	// 상태별 퀘스트 수 조회
	int countQuestByStatus(String status);

	// 최근 7일 내 등록된 퀘스트 수
	int countRecentQuests();

}
