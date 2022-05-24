package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.model.dto.Qna;
import com.ssafy.happyhouse.service.QnaService;

//@RestController
//@CrossOrigin("*")

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	QnaService service;
	
	@GetMapping("/list")
	public String list(PageBean bean, Model model) {
		model.addAttribute("list", service.searchAll(bean));
		return "/qna";
	}
	
	@GetMapping("/search")
	public String list(String articleno, Model model) {
		model.addAttribute("qna", service.search(articleno));
		return "searchQna";
	}
	
	@GetMapping("/writeQna")
	public String write() {
		return "/writeQna";
	}
	
	
	@GetMapping("/insertForm")
	public String insertForm() {
		return "notebook/insert";
	}
	
	@PostMapping("/insert")
	public String insert(Qna qna, HttpSession session) {
		Member member = (Member) session.getAttribute("memberInfo");
		qna.setUserid(member.getId());
		service.insertQna(qna);
		return "redirect:/qna/list";
		//return "redirect:search?no="+board.getNo();
	}
	
	@GetMapping("/updateForm")
	public String updateForm(String articleno, Model model) {
		model.addAttribute("qna", service.search(articleno));
		return "updateQna";
	}
	
	@PostMapping("/update/{articleno}")
	public String update(Qna qna) {
		service.updateQna(qna);
		return "redirect:/qna/search?articleno=" + qna.getArticleno();
	}
	
	@GetMapping("/answerForm")
	public String answerForm(String articleno, Model model) {
		model.addAttribute("qna", service.search(articleno));
		System.out.println();
		return "answerQna";
	}
	
	@PostMapping("/insertAs/{articleno}")
	public String insertAs(Qna qna) {
		service.insertAs(qna);
		return "redirect:/qna/search?articleno=" + qna.getArticleno();
	}
	
	@GetMapping("/updateAsForm")
	public String updateAsForm(String articleno, Model model) {
		model.addAttribute("qna", service.search(articleno));
		return "updateQnaAs";
	}
	
	@PostMapping("/updateAs/{articleno}")
	public String updateAs(Qna qna) {
		service.updateAs(qna);
		return "redirect:/qna/search?articleno=" + qna.getArticleno();
	}
	
	@GetMapping("/remove")
	public String remove(String articleno) {
		service.deleteQna(articleno);
		return "redirect:list";
	}

}
