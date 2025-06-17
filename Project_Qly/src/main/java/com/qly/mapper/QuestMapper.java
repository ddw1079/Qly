package com.qly.mapper;

import java.util.List;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.dto.UserDto;

public interface QuestMapper {

    // 퀘스트 단일 저장
    void insertQuest(QuestDto quest);

    // 퀘스트에 속한 작업(Task) 저장
    void insertTask(QuestTaskDto task);

    // 전체 퀘스트 리스트 조회
    List<QuestDto> getAllQuests();

    // 키워드로 퀘스트 검색
    List<QuestDto> searchQuests(String keyword);
    
    void insertUser(UserDto dto);

    // (필요하면) 퀘스트 단일 조회, 수정, 삭제 메서드 추가 가능
}
