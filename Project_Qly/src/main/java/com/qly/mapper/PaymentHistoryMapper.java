package com.qly.mapper;

import java.util.List;

import com.qly.vo.PaymentHistoryVo;

public interface PaymentHistoryMapper {
    // 결제 히스토리 전체 조회
	public List<PaymentHistoryVo> findAllHistories();
    // 특정 유저의 결제 히스토리 조회
	public List<PaymentHistoryVo> findHistoriesByUserId(int userId);
    // 결제 히스토리 추가
	public void insertHistory(PaymentHistoryVo ph);
}
