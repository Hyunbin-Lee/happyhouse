package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.service.BoardService;

//@RestController
//@CrossOrigin("*")

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@GetMapping("/list")
	public String list(PageBean bean, Model model) {
		model.addAttribute("list", service.searchAll(bean));
		return "/board";
	}
	
	@GetMapping("/search")
	public String list(String no, Model model) {
		model.addAttribute("board", service.search(no));
		return "searchBoard";
	}
	
	@GetMapping("/writeBoard")
	public String write() {
		return "/writeBoard";
	}
	
	
	@GetMapping("/insertForm")
	public String insertForm() {
		return "notebook/insert";
	}
	
	@PostMapping("/insert")
	public String insert(Board board) {
		service.insertBoard(board);
		return "redirect:/board/list";
		//return "redirect:search?no="+board.getNo();
	}
	
	@GetMapping("/updateForm")
	public String updateForm(String no, Model model) {
		model.addAttribute("notebook", service.search(no));
		return "board/update";
	}
	
	@PostMapping("/update")
	public String update(Board board) {
		service.updateBoard(board);
		return "redirect:search?no="+board.getNo();
	}
	
	@GetMapping("/remove")
	public String remove(String no) {
		service.deleteBoard(no);
		return "redirect:list";
	}

}
