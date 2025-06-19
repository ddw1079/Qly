package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qly.dto.CoinChargeDto;
import com.qly.mapper.CoinMapper;
import com.qly.vo.CoinHistoryVo;
import com.qly.vo.PaymentHistoryVo;

@Service
public class CoinService {

    @Autowired
    private CoinMapper coinMapper;
    
	@Transactional
	public void processCharge(int i, CoinChargeDto req) {
		int coinAmount = req.getCoinAmount();
		int amountWon = req.getPaid_amount();

		// 1. PAYMENTS 테이블 업데이트 또는 생성
		coinMapper.updateInsertPayment(i, coinAmount);

		// 2. COIN_HISTORY 삽입
		Integer currentCoin = coinMapper.getCurrentCoin(i);
		coinMapper.insertCoinHistory(i, coinAmount, currentCoin, "충전", 0);

		// 3. PAYMENT_HISTORY 삽입
		coinMapper.insertPaymentHistory(i, amountWon, currentCoin, "충전");
	}

    // 전체 결제 히스토리 조회
    public List<PaymentHistoryVo> getAllPaymentHistories() {
        return coinMapper.findAllPaymentHistories();
    }

    // 특정 유저의 결제 히스토리 조회
    public List<PaymentHistoryVo> getPaymentHistoriesByUserId(String userId) {
        return coinMapper.findPaymentHistoriesByUserId(userId);
    }

    // 전체 코인 히스토리 조회
    public List<CoinHistoryVo> getAllCoinHistories() {
        return coinMapper.findAllCoinHistories();
    }

    // 특정 유저의 코인 히스토리 조회
    public List<CoinHistoryVo> getCoinHistoriesByUserId(String userId) {
        return coinMapper.findCoinHistoriesByUserId(userId);
    }
}
