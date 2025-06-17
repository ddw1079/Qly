package com.qly.mapper;

import java.util.List;

import com.qly.vo.CoinHistoryVo;

public interface CoinHistoryMapper {
	// 코인 히스토리 전체 조회
	public List<CoinHistoryVo> findAllHistories();
	// 특정 유저의 코인 히스토리 조회
	public List<CoinHistoryVo> findHistoriesByUserId(int userId);
	// 코인 히스토리 추가
	public void insertHistory(CoinHistoryVo ch);
	
}
