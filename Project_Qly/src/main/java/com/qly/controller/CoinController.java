package com.qly.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qly.dto.CoinChargeDto;
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
        System.out.println("모델에 코인 히스토리 추가 완료");
        // 결제 히스토리 조회
        List<PaymentHistoryVo> paymentHistories = coinService.getPaymentHistoriesByUserId(loginUser.getUserId());
        System.out.println("결제 히스토리: " + paymentHistories);
        // 모델에 결제 히스토리 추가
        model.addAttribute("paymentHistories", paymentHistories);
        System.out.println("모델에 결제 히스토리 추가 완료");

        return "payments/coin_history"; // 뷰 이름 반환
    }

	@RequestMapping(value = "/success", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> chargeSuccess(@RequestBody CoinChargeDto request,
	                                       HttpSession session) {
		UserDto loginUser = (UserDto) session.getAttribute("loginUser");
		if (loginUser == null) {
            return new ResponseEntity<String>("로그인 필요", HttpStatus.UNAUTHORIZED);
        }
        coinService.adjustCoinByPayment(loginUser.getUserId(), request.getCoinAmount(), request.getPaymentMethod() + "_" + request.getReason());

		return new ResponseEntity<String>(HttpStatus.OK);
	}
}
