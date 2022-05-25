package com.ssafy.happyhouse.controller;


import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.service.KakaoService;

@Controller
public class KakaoController {
	
	@Autowired
	KakaoService kakaoService;
	
	Member member;
	
	@RequestMapping(value = "/main/kakao_login.ajax")
	public String kakaoLogin() {
		StringBuffer loginUrl = new StringBuffer();
		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
		loginUrl.append("aa5c8485e1ea5418462950dc22efbcc9");
		loginUrl.append("&redirect_uri=");
		loginUrl.append("http://localhost:8888/kakao_callback");
		loginUrl.append("&response_type=code");

		return "redirect:" + loginUrl.toString();
	}
	
	@RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
    public String redirectkakao(@RequestParam String code, Model model, HttpSession session) throws Exception {
            System.out.println("###code#### : " + code);
            
            //접속토큰 get
            String kakaoToken = kakaoService.getReturnAccessToken(code);
            
            HashMap<String, Object> userInfo = kakaoService.getUserInfo(kakaoToken);
            System.out.println("###access_Token#### : " + kakaoToken);
            System.out.println("###email#### : " + userInfo.get("email"));
            System.out.println("###nickname#### : " + userInfo.get("nickname"));
           
            JSONObject kakaoInfo =  new JSONObject(userInfo);
            model.addAttribute("kakaoInfo", kakaoInfo);
            
            Member member = new Member();
            int idx = ((String)userInfo.get("email")).indexOf("@");
            String id = ((String)userInfo.get("email")).substring(0, idx);
            member.setEmail((String)userInfo.get("email"));
            member.setId(id);
            member.setName((String)userInfo.get("nickname"));
            member.setPassword("*******");
            member.setAddress("미기입");
            member.setPhone("미기입");
            System.out.println(member.toString());
            kakaoService.register(member);
            session.setAttribute("memberInfo", member);
            
            /*로그아웃 처리 시, 사용할 토큰 값*/
            session.setAttribute("kakaoToken", kakaoToken);
            
        return "redirect:/";
    }
}
