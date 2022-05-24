package com.ssafy.happyhouse.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.service.MemberService;

//@RestController
//@CrossOrigin("*")

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/list")
	public String list(PageBean bean, Model model) throws SQLException {
		model.addAttribute("list", service.searchAll(bean));
		return "/manageMember";
	}
	
	@PostMapping("/delete")
	public String remove(@RequestParam("memberId") String id) throws SQLException {
		service.delete(id);
		return "redirect:/admin/list";
	}

}
