package com.ssafy.happyhouse.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class KaKaoController {
	
	
	@RequestMapping(value = "/main/kakao_login.ajax")
	public String kakaoLogin() {
		StringBuffer loginUrl = new StringBuffer();
		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
		loginUrl.append("aa5c8485e1ea5418462950dc22efbcc9");
		loginUrl.append("&redirect_uri=");
		loginUrl.append("https://localhost:8888/kakao_callback");
		loginUrl.append("&response_type=code");

		return "redirect:" + loginUrl.toString();
	}

}
