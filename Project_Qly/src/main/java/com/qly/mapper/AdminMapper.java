package com.qly.mapper;

import com.qly.dto.QuestDto;
import com.qly.dto.UserDto;
import java.util.List;

public interface AdminMapper {

    // ��ü ȸ�� ��ȸ
    List<UserDto> findAllUsers();

    // ���̵� �Ǵ� �г��� �˻�
    List<UserDto> searchUsers(String keyword);

    // ȸ�� ����
    void deleteUser(String userId);

    // ����Ʈ ��ü ���
    List<QuestDto> getAllQuests();

    // ����Ʈ �˻�
    List<QuestDto> searchQuests(String keyword);

    // ��ü ȸ�� �� ��ȸ
    int countAllUsers();
}
