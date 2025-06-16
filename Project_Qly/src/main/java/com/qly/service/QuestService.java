package com.qly.service;

import java.util.List;

import com.qly.dto.QuestDto;


public interface QuestService {

	List<QuestDto> getAllQuests();

	// 키워드로 검색한 퀘스트 목록 가져오기
	List<QuestDto> searchQuests(String keyword);

	// 퀘스트 및 연관된 태스크들 저장하기
	void insertQuestWithTasks(QuestDto quest);

	// 단순히 퀘스트 저장만 할 수도 있음
	void insertQuest(QuestDto quest);

}
