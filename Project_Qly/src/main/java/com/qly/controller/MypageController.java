package com.qly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@RequestMapping(value="/")
	public String welcomeToMypage() {
		return "mypage/main/user_layout";
	}
}
