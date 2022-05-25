package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.CommentMapper;
import com.ssafy.happyhouse.model.dto.Comment;

@Service
public class CommentServiceImp implements CommentService {
	
	@Autowired
	CommentMapper mapper;
	
	@Override
	public int insertComment(Comment comment) throws Exception {
		return mapper.commentInsert(comment);
	}

	@Override
	public int updateComment(Comment comment) throws Exception {
		return mapper.commentUpdate(comment);
	}

	@Override
	public int deleteComment(int cno) throws Exception {
		return mapper.commentDelete(cno);
	}

	@Override
	public List<Comment> searchComment() throws Exception {
		return mapper.commentList();
	}

}
