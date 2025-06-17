package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	/*
	 * @Override public List<QuestDto> searchQuests(String keyword) { return
	 * questMapper.searchQuests(keyword); }
	 */
	@Override
	@Transactional // 트랜잭션 처리 (한 번에 모두 성공하거나 실패)
	public void insertQuest(QuestDto questDto, List<QuestTaskDto> tasks) throws Exception {
		// 1) 퀘스트 저장 (시퀀스로 questId 생성)
		questMapper.insertQuest(questDto);

		// questDto에 insert 후 시퀀스에 의해 questId 값이 들어와 있어야 함

		// 2) 각 task에 questId 세팅
		for (QuestTaskDto task : tasks) {
			task.setQuestId(questDto.getQuestId());
		}

		// 3) 퀘스트 태스크 일괄 저장
		questMapper.insertQuestTask(tasks);
	}
}
