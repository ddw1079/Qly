package com.qly.mapper;

import java.util.List;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;

public interface QuestMapper {

	// 전체 퀘스트 리스트 조회
	List<QuestDto> getAllQuests();

	// 키워드로 퀘스트 검색
	/* List<QuestDto> searchQuests(String keyword); */

	// 퀘스트 등록 (insert 후 PK 세팅)
	void insertQuest(QuestDto questDto) throws Exception;

	// 퀘스트 작업 등록
	void insertQuestTask(List<QuestTaskDto> tasks) throws Exception;
}
