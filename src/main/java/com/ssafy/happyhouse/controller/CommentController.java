package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.dto.Comment;
import com.ssafy.happyhouse.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	CommentService service;

	@RequestMapping("/list")
	@ResponseBody
	private List<Comment> searchList(Model model) throws Exception {
		return service.searchComment();
	}

	@RequestMapping("/insert")
	@ResponseBody
	private int insertComment(@RequestParam int bno, @RequestParam String content) throws Exception {
		Comment comment = new Comment();
		comment.setBno(bno);
		comment.setContent(content);
		comment.setUserid("ssesion");
		System.out.println(comment.toString());
		return service.insertComment(comment);
	}

	@RequestMapping("/update")
	@ResponseBody
	private int updateComment(@RequestParam int cno, @RequestParam String content) throws Exception {
		Comment comment = new Comment();
		comment.setCno(cno);
		comment.setContent(content);
		return service.updateComment(comment);
	}

	@RequestMapping("/delete/{cno}")
	@ResponseBody
	private int deleteComment(@PathVariable int cno) throws Exception {
		return service.deleteComment(cno);
	}
}
