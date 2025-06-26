package com.qly.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qly.mapper.CoinMapper;

@Aspect
@Component
public class CoinHistoryAspect {

    @Autowired
    private CoinMapper coinMapper;

    @AfterReturning("execution(* com.qly.service.CoinService.adjustUserCoin(int, int, String, String))")
    public void recordCoinChange(JoinPoint joinPoint) {
    	System.out.println("[AOP] CoinHistoryAspect 의 안으로 들어왔음!" + joinPoint);
        Object[] args = joinPoint.getArgs();
        int userId = (Integer) args[0];
        int coinAmount = (Integer) args[1];
        int remain = coinMapper.getCurrentCoin(userId);
        String type = (String) args[2];
        String description = (String) args[3];
//        int questId = 0;
//        if (args.length >= 4) {
//        	questId = (Integer) args[3];
//        }
        System.out.println("[AOP] CoinHistoryAspect 정상 완료됨!" + 
        "userId: " + userId + " |coinAmount: " + coinAmount + " |type: " + type + " |remain: " + remain
        + " |description: " + description);
        // QUEST_ID는 일반 결제/충전인 경우 0
        coinMapper.insertCoinHistory(userId, coinAmount, remain, type, description);
        System.out.println("[AOP] CoinHistoryAspect 정상 완료됨!");
    }
}