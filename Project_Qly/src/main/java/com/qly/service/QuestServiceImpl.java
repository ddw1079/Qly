package com.qly.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<QuestDto> getApplicantsByQuestId(int questId) {
		return questMapper.selectApplicantsByQuestId(questId);
	}

	@Override
	public void assignSolver(int questId, int userId) {
		questMapper.resetSolverFlag(questId); // 모든 신청자 IS_SOLVER = '0'
		questMapper.setSolver(questId, userId); // 선택된 유저 IS_SOLVER = '1'
		questMapper.updateQuestStatusToProgress(questId); // 퀘스트 진행중 처리
	}

	/*
	 * @Override public List<QuestDto> getInProgressQuestsByUserId(int userId) {
	 * return questMapper.getInProgressQuestsByUserId(userId); }
	 */

	@Override
	public Map<Integer, List<QuestTaskDto>> getTasksForQuests(List<QuestDto> questList) {
		Map<Integer, List<QuestTaskDto>> map = new HashMap<>();
		for (QuestDto q : questList) {
			List<QuestTaskDto> tasks = questMapper.getTasksByQuestId(q.getQuestId());
			map.put(q.getQuestId(), tasks);
		}
		return map;
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

	@Override
	public List<QuestDto> getMyProgressQuestList(int userId) {
		return questMapper.getMyProgressQuestList(userId);
	}

	@Override
	public List<QuestDto> getCompletedQuestsByUserId(int userId) {
		return questMapper.getCompletedQuestsByUserId(userId);
	}

	@Override
	public List<QuestDto> getCompletedQuestsBySolverId(int solverId) {
		return questMapper.getCompletedQuestsBySolverId(solverId);
	}

	@Override // 박윤재
	public List<QuestTaskDto> getQuestTasks(int questId) {
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

	@Override
	public List<QuestTaskDto> jongilJJangyoonjaeJJang(int questId) {
		return questMapper.jongilJJangyoonjaeJJang(questId);
	}

	@Override
	public List<QuestDto> getQuestsByApplicantUserId(int solverId) {
		return questMapper.getQuestsByApplicantUserId(solverId);
	}

	@Override
	public List<QuestDto> heagualList(int userId) {
		return questMapper.heagualList(userId);
	}

	@Override
	public void updateQuestStatus(int questId) {
		questMapper.updateQuestStatus(questId, "완료");
	}

	@Override
	public int getRewardTokensByQuestId(int questId) {
		return questMapper.getRewardTokensByQuestId(questId);
	}

	@Override
	public void markRewardGiven(int questId, int userId) {
		questMapper.markRewardGiven(questId, userId);
	}

	@Override
	public boolean isRewardGiven(int questId, int userId) {
		return questMapper.isRewardGiven(questId, userId) > 0;
	}

	@Override
	public void updateTaskCheckStatus(int taskId, boolean isChecked) {
		questTaskMapper.updateTaskCheckStatus(taskId, isChecked ? "1" : "0");
	}

	// 메인페이지에서 사용할 메소드
	@Override
	public List<QuestDto> getLatest5Quests() {
		return questMapper.getLatest5Quests();

	}

	@Override
	public List<QuestDto> getRandom3Quests() {
		return questMapper.getRandom3Quests();
	}

	@Override
	public List<String> searchCategories(String keyword) {
		return questMapper.searchCategories(keyword);
	}

}
