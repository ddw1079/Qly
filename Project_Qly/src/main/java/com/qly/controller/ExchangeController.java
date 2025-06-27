package com.qly.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.qly.dto.ExchangeDto;
import com.qly.dto.UserDto;
import com.qly.service.CoinService;
import com.qly.service.ExchangeService;

@Controller
@RequestMapping("/exchange")
public class ExchangeController {

    @Autowired
    private ExchangeService exchangeService;
    
    @Autowired
    private CoinService coinService;

    @RequestMapping(value = "/withdrawForm", method = RequestMethod.GET)
    public String showWithdrawForm(HttpSession session, Model model) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login/loginForm";
        }

        int userId = loginUser.getUserId();
        ExchangeDto exchangeDto = exchangeService.getExchangeInfo(userId);
        model.addAttribute("exchange", exchangeDto);

        return "exchange/exchangemain";
    }

    @RequestMapping(value = "/withdraw.do", method = RequestMethod.POST)
    public String handleWithdrawForm(@RequestParam("amount") int amount,
                                     @RequestParam("password") String password,
                                     HttpSession session,
                                     Model model) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login/loginForm";
        }

        int userId = loginUser.getUserId();

        // boolean result = exchangeService.processWithdraw(userId, amount, password);
        coinService.adjustUserCoinByPayment(userId, -amount, "코인 원화 환전");
        return "/payments/history.do";
        
//        if (result) {
//            // 출금 성공 시 최근 출금 내역 페이지로 이동
//            return "redirect:/exchange/history.jsp?latest=true";
//        } else {
//            // 출금 실패 시 다시 출금 폼을 보여주며 오류 메시지 표시
//            model.addAttribute("errorMsg", "출금에 실패했습니다. 비밀번호 또는 잔액을 확인해주세요.");
//
//            // 사용자 출금 정보 다시 조회해서 JSP에 전달
//            ExchangeDto exchangeDto = exchangeService.getExchangeInfo(userId);
//            model.addAttribute("exchange", exchangeDto);
//
//            return "exchange/exchangemain";  // exchangemain.jsp 위치 확인 필요
//        }
        
        
    }
} // 깨진 한글수정
