package com.qly.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.mapper.QuestMapper;

@Service
public class QuestServiceImpl implements QuestService {

	@Autowired
	private QuestMapper questMapper;

	@Override
	public List<QuestDto> getAllQuests() {
		return questMapper.getAllQuests();
	}

	@Override
	public void registerQuest(QuestDto quest) {
		questMapper.insertQuest(quest); // questId가 DTO에 반영됨

		if (quest.getTasks() != null) {
			for (QuestTaskDto task : quest.getTasks()) {
				task.setQuestId(quest.getQuestId());
				questMapper.insertQuestTask(task);
			}
		}
	}
}
