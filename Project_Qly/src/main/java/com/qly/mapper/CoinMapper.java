package com.qly.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.qly.vo.CoinHistoryVo;
import com.qly.vo.PaymentHistoryVo;

@Mapper
public interface CoinMapper {
	void updateInsertPayment(@Param("userId") int i, @Param("coinAmount") int coinAmount);
	Integer getCurrentCoin(@Param("userId") int userId);

	void insertCoinHistory(@Param("userId") int userId,
	                       @Param("amount") int amount,
	                       @Param("remain") int remain,
	                       @Param("type") String type,
	                       @Param("questId") int questId);

	void insertPaymentHistory(@Param("userId") int userId,
	                          @Param("amount") int amount,
	                          @Param("remain") int remain,
	                          @Param("type") String type);
	// 코인 히스토리 관련
	List<CoinHistoryVo> findAllCoinHistories();
	List<CoinHistoryVo> findCoinHistoriesByUserId(@Param("userId") int userId);
	void insertCoinHistory(CoinHistoryVo vo);

	// 결제 히스토리 관련
	List<PaymentHistoryVo> findAllPaymentHistories();
	List<PaymentHistoryVo> findPaymentHistoriesByUserId(@Param("userId") int userId);
	void insertPaymentHistory(PaymentHistoryVo vo);

	// 기타 예시 (코인 업데이트 등)
	void updateCoin(@Param("userId") Long userId, @Param("coinAmount") int coinAmount);
	Integer getCurrentCoin(@Param("userId") Long userId);
}