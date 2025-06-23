package com.qly.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Service("qlyService")
public class QlyServiceImpl implements QlyService {

    @Autowired
    private QuestMapper questMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder; 

    @Override
    public void insertUser(UserDto dto) throws Exception {
        questMapper.insertUser(dto);
    }

    @Override
    public UserDto login(String username, String password) {
        UserDto user = userMapper.login(username);  // username으로만 조회
        if (user == null) return null;

        //  BCrypt로 비밀번호 비교
        if (passwordEncoder.matches(password, user.getPassword())) {
            return user; // 로그인 성공
        }

        return null; // 로그인 실패
    }

    @Override
    public List<QuestTaskDto> getTasksQuestId(int questid) {
        return questMapper.getTasksQuestId(questid);
    }

    @Override
    public List<QuestTaskDto> getQuestUserId(int userId) {
        return questMapper.getQuestUserId(userId);
    }

    @Override
    public UserDto getUserById(int userId) {
        return userMapper.selectUserById(userId);
    }
}

    
}
