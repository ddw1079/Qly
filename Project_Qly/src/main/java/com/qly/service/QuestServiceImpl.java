package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.mapper.QuestMapper;
import com.qly.mapper.QuestTaskMapper;

@Service
public class QuestServiceImpl implements QuestService {

	@Autowired
	private QuestMapper questMapper;
	@Autowired
	private QuestTaskMapper questTaskMapper;

	@Override
	public List<QuestDto> getAllQuests() {
		return questMapper.getAllQuests();
	}

	@Transactional
	@Override
	public void insertQuest(QuestDto quest, String[] taskList) {
		// 1. �섏뒪�듃 �벑濡�
		questMapper.insertQuest(quest); // questId媛� �깮�꽦�맖 (keyProperty)
		System.out.println("questId AFTER insert = " + quest.getQuestId());

		// 2. �쓽猶곕궡�슜(�븷 �씪) �뿬�윭媛� �벑濡�
		if (taskList != null) {
			for (String desc : taskList) {
				if (desc != null && !desc.trim().isEmpty()) {
					QuestTaskDto task = new QuestTaskDto();
					task.setQuestId(quest.getQuestId());
					task.setDescription(desc);
					task.setIsChecked("0");
					questTaskMapper.insertQuestTask(task);
				}
			}
		}
	}

}
