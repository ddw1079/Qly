package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.mapper.CoinHistoryMapper;
import com.qly.vo.CoinHistoryVo;

@Service
public class CoinService {
    @Autowired
    private CoinHistoryMapper coinHistoryMapper;

    // 코인 히스토리 전체 조회
    public List<CoinHistoryVo> getAllCoinHistories() {
        return coinHistoryMapper.findAllCoinHistories();
    }
    // 특정 유저의 코인 히스토리 조회
    public List<CoinHistoryVo> getCoinHistoriesByUserId(int userId) {
        return coinHistoryMapper.findCoinHistoriesByUserId(userId);
    }
    // 코인 히스토리 추가
    public void addCoinHistory(CoinHistoryVo coinHistory) {
        coinHistoryMapper.addCoinHistory(coinHistory);
    }

}
