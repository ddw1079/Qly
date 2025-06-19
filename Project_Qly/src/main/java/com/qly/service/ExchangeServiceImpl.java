package com.qly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.dto.ExchangeDto;
import com.qly.mapper.ExchangeMapper;


@Service
public class ExchangeServiceImpl implements ExchangeService {

    @Autowired
    private ExchangeMapper exchangeMapper;

    @Override
    public ExchangeDto getExchangeInfo(int userId) {
        return exchangeMapper.getExchangeInfo(userId); 
    }

    @Override
    public boolean processWithdraw(int userId, int amount, String password) {
        // 1. 사용자 정보 조회
        ExchangeDto payment = exchangeMapper.getExchangeInfo(userId);  // 
        if (payment == null) return false;

        // 2. 잔액 부족 확인
        if (payment.getCurrentBalance() < amount) return false;

        // 3. 비밀번호 확인
        String userPassword = exchangeMapper.selectPasswordByUserId(userId);
        if (!userPassword.equals(password)) return false;

        // 4. 잔액 차감 및 출금 기록
        int result1 = exchangeMapper.withdrawAmount(userId, amount);
        int newBalance = payment.getCurrentBalance() - amount;
        int result2 = exchangeMapper.insertWithdrawHistory(userId, amount, newBalance, "출금");  // type 명시

        return result1 > 0 && result2 > 0;
        
    }

}

