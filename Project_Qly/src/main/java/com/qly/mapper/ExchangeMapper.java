package com.qly.mapper;

import com.qly.dto.ExchangeDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ExchangeMapper {

    // 현재 잔액 및 총 출금 등 정보 가져오기
    ExchangeDto getExchangeInfo(@Param("userId") int userId);

    // 출금 실행 (잔액 차감)
    int withdrawAmount(@Param("userId") int userId, @Param("amount") int amount);

    // 출금 기록 저장
    int insertWithdrawHistory(@Param("userId") int userId, 
                              @Param("amount") int amount, 
                              @Param("remain") int remain,
                              @Param("type") String type);

    // ✅ 사용자 비밀번호 조회 (추가 필요)
    String selectPasswordByUserId(@Param("userId") int userId);
}
