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
    public List<QuestDto> searchQuests(String keyword) {
        return questMapper.searchQuests(keyword);
    }

    @Override
    public void insertQuestWithTasks(QuestDto quest) {
        // 1) QUESTS 테이블에 퀘스트 저장
        questMapper.insertQuest(quest);

        // 2) QUEST_TASK 테이블에 태스크 여러 개 저장
        if (quest.getTasks() != null) {
            for (QuestTaskDto task : quest.getTasks()) {
                task.setQuestId(quest.getQuestId());
                questMapper.insertTask(task);
            }
        }
    }

    @Override
    public void insertQuest(QuestDto quest) {
        questMapper.insertQuest(quest);
    }
}
