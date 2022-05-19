package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.PageBean;

@Mapper
public interface BoardDao {
//	public int  getBoardNo();
	
	//게시글 작성 C
	public void insertBoard(Board board);
	
	//번호로 게시글 검색 R
	public Board search(String no);
	
	//모든 게시글 검색 R 
	public List<Board> searchAll(PageBean bean);
	public List<Board> searchAll2();
	
	//총 게시글 수 검색 R
	public int  count(PageBean bean);
	
	//게시글 수정 U
	public void updateBoard(Board board);
	
	//게시글 삭제 D
	public void deleteBoard(String no) ;
}
