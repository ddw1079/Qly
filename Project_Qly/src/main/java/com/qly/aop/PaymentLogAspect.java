package com.qly.aop;

import java.lang.System.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.qly.dto.CoinChargeDto;

@Aspect
@Component
public class PaymentLogAspect {
	
	@AfterReturning(pointcut = "execution(* com.example.service.CoinService.processCharge(..))")
	public void logChargeSuccess(JoinPoint joinPoint) {
		Long userId = (Long) joinPoint.getArgs()[0];
		CoinChargeDto req = (CoinChargeDto) joinPoint.getArgs()[1];

		System.out.println("[코인 충전] userId=" + userId 
				+ ", coinAmount=" + req.getCoinAmount()
				+ ", paid={" + req.getPaid_amount()
				+ ", method=" + req.getPaymentMethod()
				+ ", uid=" + req.getImp_uid());
	}
}