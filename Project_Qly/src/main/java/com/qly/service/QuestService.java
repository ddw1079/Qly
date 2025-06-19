package com.qly.service;

import java.util.List;


import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;

public interface QuestService {

	List<QuestDto> getAllQuests();

	void registerQuest(QuestDto quest);
	
	

	/*
	 * // �궎�썙�뱶濡� 寃��깋�븳 �섏뒪�듃 紐⑸줉 媛��졇�삤湲� List<QuestDto> searchQuests(String keyword);
	 */

}
