package com.qly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qly.mapper.CoinMapper;
import com.qly.vo.CoinHistoryVo;
import com.qly.vo.PaymentHistoryVo;

@Service("coinService")
public class CoinServiceImpl implements CoinService{

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
    @Override
    public List<PaymentHistoryVo> getAllPaymentHistories() {
        return coinMapper.findAllPaymentHistories();
    }

    // 특정 유저의 결제 히스토리 조회
    @Override
    public List<PaymentHistoryVo> getPaymentHistoriesByUserId(int userId) {
        return coinMapper.findPaymentHistoriesByUserId(userId);
    }

    // 전체 코인 히스토리 조회
    @Override
    public List<CoinHistoryVo> getAllCoinHistories() {
        return coinMapper.findAllCoinHistories();
    }

    // 특정 유저의 코인 히스토리 조회
    @Override
    public List<CoinHistoryVo> getCoinHistoriesByUserId(int userId) {
        return coinMapper.findCoinHistoriesByUserId(userId);
    }
    
    @Override
    public int getCurrentCoinById(int userId) {
		return coinMapper.getCurrentCoin(userId);
    }

    // 코인 조정 메소드. 이 메서드의 실행을 CoinHistoryAspect 가 감지함.
    @Transactional
    @Override
    public int adjustUserCoin(int userId, int coinAmount, String reason, int questId) {
        coinMapper.updateUserCoinCount(userId, coinAmount, reason, questId); // 코인 변경
		return coinMapper.getCurrentCoin(userId);
    }
    
    @Transactional
    @Override
    public void adjustTransitCoinBetweenUsersByQuest(int coinAmount, int startUID, String reason, int questId, int destUID) {
    	adjustUserCoin(startUID, -(coinAmount), reason + " 코인지불", questId);
    	adjustUserCoin(destUID, coinAmount, reason + " 코인보상", questId);
    }

    // 결제용 코인 조정 메소드. 이 메서드의 실행을 PaymentHistoryAspect 가 감지함.
    @Transactional
    @Override
    public int adjustUserCoinByPayment(int userId, int coinAmount, String reason) {
        coinMapper.updateUserCoinCountWithPayment(userId, coinAmount, reason); // 결제용 변경
        return coinMapper.getCurrentCoin(userId); // 변경된 코인 잔액 반환
    }
    
    @Override
    public void insertCoinHistory(int userId, int coinAmount, int remain, String type, int questId) {
    	coinMapper.insertCoinHistory(userId, coinAmount, remain, type, questId);
    }

    @Override
    public void insertPaymentHistory(int userId, int coinAmount, int remain, String type) {
    	coinMapper.insertPaymentHistory(userId, coinAmount, remain, type);
    }
    

}

