package com.qly.service;

import java.util.List;

import com.qly.vo.CoinHistoryVo;
import com.qly.vo.PaymentHistoryVo;

public interface CoinService {
    // 전체 결제 히스토리 조회
    public List<PaymentHistoryVo> getAllPaymentHistories();
    // 특정 유저의 결제 히스토리 조회
    public List<PaymentHistoryVo> getPaymentHistoriesByUserId(int userId);
    // 전체 코인 히스토리 조회
    public List<CoinHistoryVo> getAllCoinHistories();
    // 특정 유저의 코인 히스토리 조회
    public List<CoinHistoryVo> getCoinHistoriesByUserId(int userId);
    // 현재 코인 조회
    public int getCurrentCoinById(int userId);  

    public int adjustUserCoin(int userId, int coinAmount, String reason, int questId);
    public int adjustUserCoinByPayment(int userId, int coinAmount, String reason);
    public void adjustTransitCoinBetweenUsersByQuest(int coinAmount, int startUID, String reason, int questId, int destUID);

    public void insertCoinHistory(int userId, int coinAmount, int remain, String type, String description);
    public void insertPaymentHistory(int userId, int coinAmount, int remain, String type);
}
