package com.qly.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qly.dto.QuestDto;
import com.qly.dto.QuestTaskDto;
import com.qly.dto.UserDto;

public interface QuestMapper {

	List<QuestDto> getAllQuests();

	void insertQuest(QuestDto quest);

	void insertQuestTask(QuestTaskDto task);

	List<QuestDto> searchQuests(String keyword);

	void insertUser(UserDto dto);

	UserDto getUserByUsername(@Param("username") String username);

	List<QuestTaskDto> getTasksQuestId(int questid);

	List<QuestTaskDto> getQuestUserId(int userId);

	void insertQuestApplication(QuestDto quest);

	QuestDto selectQuestById(int questId);

	QuestDto userselectQuestById(int questId);

	QuestDto QuestById(int questId);

	void updateUserTokens(@Param("userId") int userId, @Param("totalTokens") int totalTokens);

	/* List<QuestDto> getMyQuestList(int userId); */
	List<QuestDto> getMyQuestList(@Param("userId") int userId);

	List<QuestTaskDto> getQuestTasks(int questId);

	List<QuestDto> getMyProgressQuestList(@Param("userId") int userId);

	void resetAllTaskChecks(@Param("questId") int questId);

	void setCheckedTasks(@Param("taskIds") List<Integer> taskIds);

	void reduceTokensBy100(@Param("questId") int questId);

	List<QuestDto> heagualList(@Param("userId") int userId);

	List<QuestTaskDto> jongilJJangyoonjaeJJang(int questId);

	List<QuestDto> getQuestsByApplicantUserId(@Param("userId") int userId);

	void updateQuestStatus(@Param("questId") int questId, @Param("status") String status);

	int getRewardTokensByQuestId(@Param("questId") int questId);

	void markRewardGiven(@Param("questId") int questId, @Param("userId") int userId);

	int isRewardGiven(@Param("questId") int questId, @Param("userId") int userId);

	List<QuestDto> selectApplicantsByQuestId(int questId);

	void resetSolverFlag(int questId);

	void setSolver(@Param("questId") int questId, @Param("userId") int userId);

	void updateQuestStatusToProgress(int questId);

	List<QuestTaskDto> getTasksByQuestId(int questId);

	// List<QuestDto> getInProgressQuestsByUserId(int userId);

	// 메인페이지에서 사용할 Mapper 메소드
	List<QuestDto> getLatest5Quests();

	List<QuestDto> getRandom3Quests();

	List<String> searchCategories(String keyword);

	List<QuestDto> getCompletedQuestsByUserId(@Param("userId") int userId);

}
