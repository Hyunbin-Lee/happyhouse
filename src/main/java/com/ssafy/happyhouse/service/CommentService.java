package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Comment;

public interface CommentService {
	public int insertComment(Comment comment) throws Exception;
	public int updateComment(Comment comment) throws Exception;
	public int deleteComment(int cno) throws Exception;
	public List<Comment> searchComment(int bno) throws Exception;
	public List<Comment> inquireComment(int cno) throws Exception;
}
