package com.qly.mapper;

import java.util.List;

import com.qly.vo.CoinHistoryVo;

public interface CoinHistoryMapper {
	public List<CoinHistoryVo> findAllCoinHistories();
	public List<CoinHistoryVo> findCoinHistoriesByUserId(int userId);
	public void addCoinHistory(CoinHistoryVo ch);
	
}
