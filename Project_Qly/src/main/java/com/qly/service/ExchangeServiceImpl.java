package com.qly.service;

import com.qly.dto.ExchangeDto;
import com.qly.mapper.ExchangeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

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

    // 계좌이체 출금
    @Transactional
    @Override
    public boolean processWithdraw(int userId, int amount, String password, String bankName, String accountNumber) {
        ExchangeDto payment = exchangeMapper.getExchangeInfo(userId);
        if (payment == null || payment.getCurrentBalance() < amount) {
            return false;
        }

        String hashedPassword = exchangeMapper.selectPasswordByUserId(userId);
        if (!passwordEncoder.matches(password, hashedPassword)) {
            return false;
        }

        int result1 = exchangeMapper.withdrawAmount(userId, amount);
        int newBalance = payment.getCurrentBalance() - amount;

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userId", userId);
        paramMap.put("amount", amount);
        paramMap.put("remain", newBalance);
        paramMap.put("type", "계좌이체");
        paramMap.put("bankName", bankName);
        paramMap.put("accountNumber", accountNumber);

        int result2 = exchangeMapper.insertWithdrawHistory(paramMap);

        return result1 > 0 && result2 > 0;
    }

    // 휴대폰 결제 출금
    @Transactional
    @Override
    public boolean processMobileWithdraw(int userId, int amount, String password) {
        ExchangeDto payment = exchangeMapper.getExchangeInfo(userId);
        if (payment == null || payment.getCurrentBalance() < amount) return false;

        String hashedPassword = exchangeMapper.selectPasswordByUserId(userId);
        if (!passwordEncoder.matches(password, hashedPassword)) return false;

        int result1 = exchangeMapper.withdrawAmount(userId, amount);
        int newBalance = payment.getCurrentBalance() - amount;

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userId", userId);
        paramMap.put("amount", amount);
        paramMap.put("remain", newBalance);
        paramMap.put("type", "휴대폰결제");
        paramMap.put("bankName", null);
        paramMap.put("accountNumber", null);

        int result2 = exchangeMapper.insertWithdrawHistory(paramMap);
        return result1 > 0 && result2 > 0;
    }
}
