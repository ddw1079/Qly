package com.qly.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qly.dto.UserDto;
import com.qly.service.QlyService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private QlyService qlyService;

	// 암호화용 Bean
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 로그인 폼
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String showLoginForm() {
		return "userlogin/UserLogin";
	}

	// 로그인 처리
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, Model model) {

		// UserDto user = qlyService.login(username, password);
		UserDto user = qlyService.login(username);

		System.out.println(user);

		if (user != null && passwordEncoder.matches(password, user.getPassword())) {
			session.setAttribute("loginUser", user);
			return "mainpage";
		} else {
			model.addAttribute("loginError", "아이디 또는 비밀번호가 틀렸습니다.");
			return "userlogin/UserLogin";
		}
	}

	@RequestMapping("/Qly_insert.do")
	public String insertUser1(UserDto dto) throws Exception {
		// 1. 입력된 평문 비밀번호 가져오기
		String rawPw = dto.getPassword();

		// 2. 암호화 (해싱) 처리
		String encodedPw = passwordEncoder.encode(rawPw);

		// 3. 암호화된 비밀번호로 교체
		dto.setPassword(encodedPw);

		// 4. 저장
		qlyService.insertUser(dto);// 서비스 → DAO → MyBatis 호출

		return "mainpage";
	}

	@ResponseBody
	@RequestMapping("/checkUsername")
	public Map<String, Object> checkUsername(@RequestParam("username") String username) {
		UserDto user = qlyService.getUserByUsername(username);
		boolean available = (user == null);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("available", available);
		return result;
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate(); // 세션 무효화
		return "redirect:/mainpage"; // 로그인 폼으로 리다이렉트
	}

}
