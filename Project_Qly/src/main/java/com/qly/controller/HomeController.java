package com.qly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qly.dto.QuestDto;
import com.qly.service.QuestService;

@Controller
public class HomeController {
    @Autowired
    private QuestService questService;

    @RequestMapping("/mainpage")
    public String showMainPage(Model model) {
        List<QuestDto> latest5Quests = questService.getLatest5Quests();
        model.addAttribute("latest5Quests", latest5Quests);
        List<QuestDto> random3Quests = questService.getRandom3Quests();
        model.addAttribute("random3Quests", random3Quests);

        return "mainpage"; // /WEB-INF/views/mainpage.jsp
    }

    @RequestMapping("/") // 메인 URL
    public String home() {
        return "redirect:/mainpage";
    }
}
