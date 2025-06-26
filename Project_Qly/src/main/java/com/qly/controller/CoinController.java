package com.qly.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qly.dto.UserDto;
import com.qly.service.CoinService;
import com.qly.vo.CoinHistoryVo;
import com.qly.vo.PaymentHistoryVo;

@Controller
@RequestMapping("/payments")
public class CoinController {
    @Autowired
    private CoinService coinService;

    @RequestMapping(value = "/")
    public String index() {
        return "/payments/history.do"; // 결제 페이지로 이동
    }

    // 코인 히스토리 조회
    @RequestMapping(value = "/history.do")
    public String getCoinHistory(Model model, HttpSession session) {
        // 세션에서 로그인된 사용자 정보 가져오기
    	System.out.println("결제 히스토리 페이지 ---");
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            
            return "redirect:/mainpage"; // 로그인 페이지로 리다이렉트
        }
        
        System.out.println("로그인된 사용자: " + loginUser);
        System.out.println("로그인된 사용자: " + loginUser.getUserId());
        // 로그인된 사용자의 코인 히스토리 조회
        List<CoinHistoryVo> coinHistories = coinService.getCoinHistoriesByUserId(loginUser.getUserId());
        System.out.println("코인 히스토리: " + coinHistories);
        // 모델에 코인 히스토리 추가
        model.addAttribute("coinHistories", coinHistories);
        // 결제 히스토리 조회
        List<PaymentHistoryVo> paymentHistories = coinService.getPaymentHistoriesByUserId(loginUser.getUserId());
        System.out.println("결제 히스토리: " + paymentHistories);
        // 모델에 결제 히스토리 추가
        model.addAttribute("paymentHistories", paymentHistories);

        return "/payments/coin_history";  // 뷰 이름 반환
    }

	@RequestMapping(value = "/success", method = RequestMethod.POST)
	public String chargeSuccess(int coinAmount, @RequestParam("description") String description, HttpSession session, RedirectAttributes redirectAttributes) {
		System.out.println("coinService class = " + coinService.getClass());
		System.out.println("coinAmount = " + coinAmount);
		System.out.println("description = " + description);
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			// 로그인 필요 시
            return "redirect:/login/loginForm"; // 로그인 페이지로 리다이렉트
        }
		System.out.println("loginUser.getUserId() = " + loginUser.getUserId());
        int currentCoin = coinService.adjustUserCoinByPayment(loginUser.getUserId(), coinAmount, description);

        System.out.println("결제 완료! 현재 코인: " + currentCoin);
        redirectAttributes.addFlashAttribute("chargeMessage", "충전 완료! 코인 " + coinAmount + "개가 추가되었습니다.");
        return "redirect:/payments/history.do"; // 결제 완료 후 히스토리 페이지로 리다이렉트
	}
	
	
	// CoinAmount 만큼의 코인을 startUID 에서 destUID 까지 reason 과 퀘스트 ID와 함께 로그에 박고 넘긴다.
	@RequestMapping(value = "/transit", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String transitCoin(int coinAmount, int startUID, int destUID, String reason, int questId, HttpSession session) {
		System.out.println("transit Coin 실행. ");
		coinService.adjustTransitCoinBetweenUsersByQuest(coinAmount, startUID, reason, questId, destUID);
		System.out.println("transit Coin 완료");
		return "redirect:/payments/history.do";
		
	}
	
    // @RequestMapping(value = "/test-aop")
    // public String test() {
    //     coinService.adjustUserCoin(11111, 1234, "테스트 코인 지급", 0);
    //     return "OK";
    // }
}
