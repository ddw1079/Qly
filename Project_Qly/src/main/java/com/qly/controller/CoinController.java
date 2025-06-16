package com.qly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qly.vo.CoinHistoryVo;

@Controller
@RequestMapping("/coin")
public class CoinController {
    @Autowired
    private com.qly.service.CoinService coinService;

    // 코인 히스토리 조회
    @RequestMapping("/coinHistory.do")
    public String getCoinHistory(Model model) {
        List<CoinHistoryVo> coinHistories = coinService.getAllCoinHistories();
        model.addAttribute("coinHistories", coinHistories);

        
        // 코인 히스토리 조회 로직
        // 예: List<CoinHistoryVo> history = coinService.getCoinHistory();
        // model.addAttribute("coinHistory", history);
        return "CoinHistory"; // 뷰 이름 반환
    }

}
