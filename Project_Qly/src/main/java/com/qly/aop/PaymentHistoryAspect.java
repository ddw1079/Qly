package com.qly.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qly.mapper.CoinMapper;
import com.qly.service.CoinService;

@Aspect
@Component
public class PaymentHistoryAspect {
    @Autowired
    private CoinMapper coinMapper;

    @Autowired
    private CoinService coinService;

    @AfterReturning("execution(* com.qly.service.CoinService.adjustUserCoinByPayment(..))")
    public void recordPaymentHistory(JoinPoint joinPoint) {
    	System.out.println("[AOP] PaymentHistoryAspect 의 안으로 들어왔음!" + joinPoint);
        Object[] args = joinPoint.getArgs();
        int userId = (Integer) args[0];
        int coinAmount = (Integer) args[1];
        String type = (String) args[2];
        int remain = coinService.getCurrentCoinById(userId);
        System.out.println("[AOP] PaymentHistoryAspect 정상 완료됨!" + 
                "userId: " + userId + " |coinAmount: " + coinAmount + " |type: " + type + " |remain: " + remain);
        coinMapper.insertPaymentHistory(userId, coinAmount, remain, type);
        System.out.println("[AOP] PaymentHistoryAspect 정상 완료됨!");
    }
}