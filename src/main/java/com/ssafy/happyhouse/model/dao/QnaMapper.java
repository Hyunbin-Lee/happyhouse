package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Qna;
@Mapper
public interface QnaMapper {
	public List<Qna> selectBoard();
	public Qna selectBoardByNo(int articleno);
	public int insertBoard(Qna board);
	public int updateBoard(Qna board);
	public int deleteBoard(int articleno);
}