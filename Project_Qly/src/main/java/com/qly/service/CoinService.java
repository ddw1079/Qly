package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qly.mapper.CoinMapper;
import com.qly.vo.CoinHistoryVo;
import com.qly.vo.PaymentHistoryVo;

@Service
public class CoinService {

    @Autowired
    private CoinMapper coinMapper;
    
	// @Transactional
	// public void processCharge(int i, CoinChargeDto req) {
	// 	int coinAmount = req.getCoinAmount();
	// 	int amountWon = req.getPaid_amount();
    //     String reason = req.getReason();

    //     coinMapper.updateUserCoinCountWithPayment(, i, reason);
	// }

    // 전체 결제 히스토리 조회
    public List<PaymentHistoryVo> getAllPaymentHistories() {
        return coinMapper.findAllPaymentHistories();
    }

    // 특정 유저의 결제 히스토리 조회
    public List<PaymentHistoryVo> getPaymentHistoriesByUserId(int userId) {
        return coinMapper.findPaymentHistoriesByUserId(userId);
    }

    // 전체 코인 히스토리 조회
    public List<CoinHistoryVo> getAllCoinHistories() {
        return coinMapper.findAllCoinHistories();
    }

    // 특정 유저의 코인 히스토리 조회
    public List<CoinHistoryVo> getCoinHistoriesByUserId(int userId) {
        return coinMapper.findCoinHistoriesByUserId(userId);
    }

    // 코인 조정 메소드. 이 메서드의 실행을 CoinHistoryAspect 가 감지함.
    @Transactional
    public void adjustUserCoin(int userId, int coinAmount, String reason, int questId) {
        coinMapper.updateUserCoinCount(userId, coinAmount, reason, questId); // 코인 변경
    }

    // 결제용 코인 조정 메소드. 이 메서드의 실행을 PaymentHistoryAspect 가 감지함.
    @Transactional
    public void adjustCoinByPayment(int userId, int coinAmount, String reason) {
        coinMapper.updateUserCoinCountWithPayment(userId, coinAmount, reason); // 결제용 변경
    }

}

