package com.qly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qly.dto.ExchangeDto;
import com.qly.mapper.ExchangeMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@Service
public class ExchangeServiceImpl implements ExchangeService {

    @Autowired
    private ExchangeMapper exchangeMapper;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder; 

    @Override
    public ExchangeDto getExchangeInfo(int userId) {
        return exchangeMapper.getExchangeInfo(userId); 
    }

    @Override
    public boolean processWithdraw(int userId, int amount, String password) {
		// 현재 잔액 조회 
        ExchangeDto payment = exchangeMapper.getExchangeInfo(userId); 
        
        //잔액 부족 또는 정보 없음
        if (payment == null || payment.getCurrentBalance() < amount) return false;
        
        //암호화된 비밀번호 가져오기
        String hashedPassword = exchangeMapper.selectPasswordByUserId(userId);

        //비밀번호 비교 실패
        if (!passwordEncoder.matches(password, hashedPassword)) return false;

        //출금처리
        int result1 = exchangeMapper.withdrawAmount(userId, amount);
        int newBalance = payment.getCurrentBalance() - amount;
        int result2 = exchangeMapper.insertWithdrawHistory(userId, amount, newBalance, "출금");
        
        //성공 여부 반환
        return result1 > 0 && result2 > 0;
    }
}

