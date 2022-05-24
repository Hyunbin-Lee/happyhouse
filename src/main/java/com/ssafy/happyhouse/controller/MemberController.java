package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberService service;

	// 로그인 페이지 이동
	@GetMapping("/login")
	public String login() {
		return "/login";
	}

	// 회원가입 페이지 이동
	@GetMapping("/join")
	public String join() {
		return "/join";
	}

	//비밀번호 찾기 페이지 이동 
	@GetMapping("/findPassword")
	public String findpw() {
		return "/findPassword";
	}
	
	//비밀번호 찾기 
	//비밀번호 찾기 페이지 이동 
	@PostMapping("/findPassword")
	public String findpw(@RequestParam Map<String, String> map,RedirectAttributes redir) throws SQLException {
		logger.info("비밀번호찾기  ------------------------- : id {}, phone {} ", map.get("id"),map.get("phone"));
		String pw=service.findPW(map);
		if(pw!=null) {
			redir.addFlashAttribute("msg", "비밀번호는 "+pw+"입니다. 다시 로그인 해주세요 ");
			return "redirect:/user/login";
		}else {
			redir.addFlashAttribute("msg", "해당되는 회원정보가 없습니다.");
			return "/findPassword";
		}
		
	}
	
	// 회원가입
	@PostMapping("/register")
	public String register(Member member) throws SQLException {
		service.register(member);
		return "redirect:/user/login";
	}

	// 로그인
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session,
		HttpServletResponse response) throws Exception {
		logger.info("사용자 로그인 ------------------------- : {}", map.get("id"));
		Member member = service.login(map);
		if (member != null) {
			session.setAttribute("memberInfo", member);
			Cookie cookie = new Cookie("ssafy_id", map.get("id"));
			cookie.setPath("/");
			if ("saveok".equals(map.get("idsave"))) {
				cookie.setMaxAge(60 * 60 * 24 * 365 * 40);
			} else {
				cookie.setMaxAge(0);
			}
			response.addCookie(cookie);
			return "redirect:/";
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요!");
			return "/login";
		}
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 회원정보 조회
	@GetMapping("/memberInfo")
	public String memberInfo(HttpSession session, Model model) throws SQLException {
		Member member = (Member) session.getAttribute("memberInfo");
		logger.info("회원정보조회 ----------------- : {}", member);
		member = service.inquire(member.getId());
		if (member != null) {
			model.addAttribute("member", member);
			return "/userInfo";
		} else {
			model.addAttribute("msg", "회원정보 조회 중 알수 없는 오류 발생 ");
			return "/error";
		}
	}

	// 회원정보 수정
	@PostMapping("/update")
	public String updateInfo(Member member) throws SQLException {
		logger.info("회원정보수정  ---------------------  : {}", member);
		System.out.println("here"+member.toString());
		service.modify(member);
		return "redirect:/user/memberInfo";
	}

	// 회원 탈퇴
	@GetMapping("/delete")
	public String delete(HttpSession session) throws SQLException {
		String id = (String) session.getAttribute("id");
		logger.info("회원정보삭제  ---------------------  : {}", id);
		service.delete(id);
		session.invalidate();
		return "redirect:/";
	}
}
