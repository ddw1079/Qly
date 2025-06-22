package com.qly.service;

import com.qly.dto.ExchangeDto;

public interface ExchangeService {

    // 현재 잔액 조회
    ExchangeDto getExchangeInfo(int userId);

    // 계좌이체 출금 처리 - 은행명과 계좌번호 포함
    boolean processWithdraw(int userId, int amount, String password, String bankName, String accountNumber);

    // 휴대폰 결제 출금 처리
    boolean processMobileWithdraw(int userId, int amount, String password);

}
