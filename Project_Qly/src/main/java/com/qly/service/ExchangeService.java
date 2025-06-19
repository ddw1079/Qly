package com.qly.service;

import com.qly.dto.ExchangeDto;

public interface ExchangeService {

    // 현재 잔액 조회
	ExchangeDto getExchangeInfo(int userId);

    // 출금 처리
    boolean processWithdraw(int userId, int amount, String password);
}
