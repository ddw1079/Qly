package com.qly.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class CoinHistoryAspect {
    @Autowired
    private com.qly.mapper.CoinMapper coinMapper;

    @After("execution(* com.qly.mapper.CoinMapper.updateUserCoinCount(..))")
    public void recordCoinChange(JoinPoint joinPoint) {
        int userId = (Integer) joinPoint.getArgs()[0];
        int coinAmount = (Integer) joinPoint.getArgs()[1];
        int currentCoin = coinMapper.getCurrentCoin(userId);
        String reason =  (String) joinPoint.getArgs()[2];
        int questId = (Integer) joinPoint.getArgs()[3]; // 예시로 questId를 추가

        System.out.println("[AOP] 코인 변경 감지 → userId=" + userId + ", amount=" + coinAmount + ", currentCoin=" + currentCoin + ", reason=" + reason + ", questId=" + questId);
        // TODO: coinMapper.insertCoinHistory(...) 같은 실제 기록 로직 연결 가능
        
        coinMapper.insertCoinHistory(userId, coinAmount, currentCoin, reason, questId);
        System.out.println("[AOP] 코인기록 테이블에 기록됨 → userId=" + userId + ", amount=" + coinAmount + ", reason=" + reason + ", questId=" + questId);
    }
}