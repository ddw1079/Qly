package com.qly.controller;

import com.qly.dto.ExchangeDto;
import com.qly.dto.UserDto;
import com.qly.service.ExchangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/exchange")
public class ExchangeController {

    @Autowired
    private ExchangeService exchangeService;

    // 1. 출금 화면
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

    // 2. 계좌이체 출금 처리
    @RequestMapping(value = "/withdraw.do", method = RequestMethod.POST)
    public String handleWithdrawForm(@RequestParam("amount") int amount,
                                     @RequestParam("password") String password,
                                     @RequestParam(value = "bankName", required = false) String bankName,
                                     @RequestParam(value = "accountNumber", required = false) String accountNumber,
                                     HttpSession session,
                                     Model model) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login/loginForm";
        }

        int userId = loginUser.getUserId();
        boolean result = exchangeService.processWithdraw(userId, amount, password, bankName, accountNumber);

        if (result) {
            return "redirect:/exchange/history.jsp?latest=true";
        } else {
            model.addAttribute("errorMsg", "출금에 실패했습니다. 비밀번호 혹은 입력 정보를 다시 확인해주세요.");
            ExchangeDto exchangeDto = exchangeService.getExchangeInfo(userId);
            model.addAttribute("exchange", exchangeDto);
            return "exchange/exchangemain";
        }
    }

    // 3. 모바일 금액 세션 저장
    @RequestMapping(value = "/saveMobileAmount", method = RequestMethod.POST)
    public void saveMobileAmount(@RequestParam("amount") int amount, HttpSession session) {
        session.setAttribute("mobileWithdrawAmount", amount);
    }

    // ✅ 4. 모바일 출금 성공 (JSON 응답)
    @RequestMapping(value = "/mobileSuccess.do", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Map<String, Object>> handleMobileSuccess(@RequestParam("imp_uid") String impUid,
                                                                    @RequestParam("merchant_uid") String merchantUid,
                                                                    HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        if (loginUser == null) {
            result.put("success", false);
            result.put("message", "로그인이 필요합니다.");
            return ResponseEntity.ok(result);
        }

        Integer amount = (Integer) session.getAttribute("mobileWithdrawAmount");
        if (amount == null) {
            result.put("success", false);
            result.put("message", "출금 금액이 설정되지 않았습니다.");
            return ResponseEntity.ok(result);
        }

        int userId = loginUser.getUserId();
        boolean success = exchangeService.processMobileWithdraw(userId, amount, loginUser.getPassword());

        if (success) {
            session.removeAttribute("mobileWithdrawAmount");
            result.put("success", true);
            result.put("message", "🎉 거래가 완료되었습니다.");
        } else {
            result.put("success", false);
            result.put("message", "출금 처리 중 오류가 발생했습니다.");
        }

        return ResponseEntity.ok(result);
    }
}
