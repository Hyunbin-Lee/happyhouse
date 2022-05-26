package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Comment;

@Mapper
public interface CommentMapper {
	//댓글 개수
	public int commentCount() throws Exception;
	//댓글 목록
	public List<Comment> commentList(int bno) throws Exception;
	//댓글 등록
	public int commentInsert(Comment comment) throws Exception;
	//댓글 수정
	public int commentUpdate(Comment comment) throws Exception;
	//댓글 삭제
	public int commentDelete(int cno) throws Exception;
	//조회
	public List<Comment> commentInquire(int cno) throws Exception;
}
