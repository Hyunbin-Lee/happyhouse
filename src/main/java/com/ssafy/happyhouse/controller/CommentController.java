package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	CommentService service;

	@RequestMapping("/list")
	@ResponseBody
	private List<Comment> searchList(int bno, Model model) throws Exception {
		return service.searchComment(bno);
	}

	@RequestMapping("/insert")
	@ResponseBody
	private int insertComment(@RequestParam int bno, @RequestParam String content, HttpSession session) throws Exception {
		Comment comment = new Comment();
		comment.setBno(bno);
		comment.setContent(content);
		Member member = (Member) session.getAttribute("memberInfo");
		comment.setUserid(member.getId());
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
	private int deleteComment(@PathVariable int cno, HttpSession session) throws Exception {
		List<Comment> comment = service.inquireComment(cno);
		System.out.println(comment);
		String commentId = comment.get(0).userid;
		System.out.println(commentId);
		Member member = (Member) session.getAttribute("memberInfo");
		String id = member.getId();
		System.out.println(id);
		if(id.equals(commentId)) {
			System.out.println("삭제중 ..");
			return service.deleteComment(cno);
		}
		return 0;
	}
}
