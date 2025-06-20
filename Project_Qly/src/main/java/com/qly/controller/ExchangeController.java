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
import com.qly.service.ExchangeService;


@Controller
@RequestMapping("/exchange")
public class ExchangeController {

    @Autowired
    private ExchangeService exchangeService;

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

        boolean result = exchangeService.processWithdraw(userId, amount, password);

        if (result) {
            //  異쒓툑 �꽦怨� �떆 �넂 異쒓툑 �궡�뿭 �럹�씠吏�濡� �씠�룞
            return "redirect:/exchange/history.jsp?latest=true";
        } else {
            //  異쒓툑 �떎�뙣 �떆 �넂 異쒓툑 �뤌 �떎�떆 蹂댁뿬二쇰ŉ �삤瑜� 硫붿떆吏� �몴�떆
            model.addAttribute("errorMsg", "異쒓툑�뿉 �떎�뙣�뻽�뒿�땲�떎. 鍮꾨�踰덊샇 �삉�뒗 �옍�븸�쓣 �솗�씤�빐二쇱꽭�슂.");

            // �옍�븸 �젙蹂� �떎�떆 議고쉶�븯�뿬 JSP�뿉 �쟾�떖
            ExchangeDto exchangeDto = exchangeService.getExchangeInfo(userId);
            model.addAttribute("exchange", exchangeDto);

            return "exchange/exchangemain";  // exchangemain.jsp媛� �쐞移섑븳 寃쎈줈 �솗�씤 �븘�슂
        }
    }

}


