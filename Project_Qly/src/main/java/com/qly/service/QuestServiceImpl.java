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
	public int insertQuest(QuestDto quest, String[] taskList) {
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
		return quest.getQuestId();
	}

	@Override
	public void applyQuest(QuestDto quest) {
		questMapper.insertQuestApplication(quest);
	}

	@Override
	public QuestDto getQuestById(int questId) {
		QuestDto quest = questMapper.selectQuestById(questId); // QUESTS留� 議고쉶�븿
		List<QuestTaskDto> tasks = questTaskMapper.getTasksByQuestId(questId); // QUEST_TASK 議고쉶 異붽�
		quest.setTasks(tasks); // QuestDto �븞�뿉 �꽭�똿
		return quest;
	}


	@Override
	public void updateTokens(int userId, int totalTokens) {
		questMapper.updateUserTokens(userId, totalTokens);
	}

	@Override // 박윤재
	public List<QuestDto> getMyQuestList(int userId) {
		return questMapper.getMyQuestList(userId);
	}
	@Override  // 박윤재
	public List<QuestTaskDto> getQuestTasks(int questId){
		return questMapper.getQuestTasks(questId);
	}
	
	@Override
	public void updateTaskChecks(int questId, List<Integer> checkedTaskIds) {
		questMapper.resetAllTaskChecks(questId); // 먼저 전부 0으로 초기화
	    if (!checkedTaskIds.isEmpty()) {
	    	questMapper.setCheckedTasks(checkedTaskIds); // 선택된 ID만 1로 변경
	    }
	}
	
	@Override
    public void deductRewardTokens(int questId) {
        questMapper.reduceTokensBy100(questId);
    }


}
