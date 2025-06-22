package com.qly.mapper;

import com.qly.dto.ExchangeDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

@Mapper
public interface ExchangeMapper {

    // 현재 잔액 및 출금 정보 조회
    ExchangeDto getExchangeInfo(@Param("userId") int userId);

    // 잔액 차감 처리
    int withdrawAmount(@Param("userId") int userId, @Param("amount") int amount);

    // 출금 기록 저장 (Map 방식)
    int insertWithdrawHistory(Map<String, Object> paramMap);

    // 사용자 비밀번호 조회
    String selectPasswordByUserId(@Param("userId") int userId);
}
