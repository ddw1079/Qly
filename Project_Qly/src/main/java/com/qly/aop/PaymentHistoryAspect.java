package com.qly.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class PaymentHistoryAspect {
    @Autowired
    private com.qly.mapper.CoinMapper coinMapper;

    @After("execution(* com.qly.mapper.CoinMapper.updateUserCoinCountWithPayment(..))")
    public void recordPaymentCoin(JoinPoint joinPoint) {
        int userId = (Integer) joinPoint.getArgs()[0];
        int coinAmount = (Integer) joinPoint.getArgs()[1];
        int currentCoin = coinMapper.getCurrentCoin(userId);
        String reason = (String) joinPoint.getArgs()[2]; 

        System.out.println("[AOP] 결제 관련 코인 변경 감지 → userId=" + userId + ", amount=" + coinAmount);
        // TODO: 결제 히스토리 기록 또는 로그 추가
        coinMapper.insertPaymentHistory(userId, coinAmount, currentCoin, reason);
        System.out.println("[AOP] 결제기록 테이블에 기록됨 → userId=" + userId + ", amount=" + coinAmount + ", reason=" + reason);
    }
}