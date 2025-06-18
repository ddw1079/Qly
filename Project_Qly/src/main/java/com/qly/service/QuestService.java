package com.qly.service;

import java.util.List;


import com.qly.dto.QuestDto;

public interface QuestService {

	List<QuestDto> getAllQuests();

	void registerQuest(QuestDto quest);

	/*
	 * // 키워드로 검색한 퀘스트 목록 가져오기 List<QuestDto> searchQuests(String keyword);
	 */

}
