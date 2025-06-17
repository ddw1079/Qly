package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.mapper.CoinHistoryMapper;
import com.qly.mapper.PaymentHistoryMapper;
import com.qly.vo.CoinHistoryVo;
import com.qly.vo.PaymentHistoryVo;

@Service
public class CoinService {
    @Autowired
    private CoinHistoryMapper coinHistoryMapper;

    // 코인 히스토리 전체 조회
    public List<CoinHistoryVo> getAllCoinHistories() {
        return coinHistoryMapper.findAllHistories();
    }
    // 특정 유저의 코인 히스토리 조회
    public List<CoinHistoryVo> getCoinHistoriesByUserId(int userId) {
        return coinHistoryMapper.findHistoriesByUserId(userId);
    }
    // 코인 히스토리 추가
    public void addCoinHistory(CoinHistoryVo coinHistory) {
        coinHistoryMapper.insertHistory(coinHistory);
    }  
    
    @Autowired
    private PaymentHistoryMapper paymentHistoryMapper;
    
    // 결제 히스토리 전체 조회
    public List<PaymentHistoryVo> getAllPaymentHistories() {
        return paymentHistoryMapper.findAllHistories();
    }
    // 특정 유저의 결제 히스토리 조회
    public List<PaymentHistoryVo> getPaymentHistoriesByUserId(int userId) {
        return paymentHistoryMapper.findHistoriesByUserId(userId);
    }
    // 결제 히스토리 추가
    public void addPaymentHistory(PaymentHistoryVo paymentHistory) {
        paymentHistoryMapper.insertHistory(paymentHistory);
    }
}
