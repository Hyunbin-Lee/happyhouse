package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.PageBean;

public interface BoardService {
	//게시글 작성 C
	public void insertBoard(Board board);
	
	//번호로 게시글 검색 R
	public Board search(String no);
	
	//모든 게시글 검색 R 
	public List<Board> searchAll(PageBean bean);
	
	//게시글 수정 U
	public void updateBoard(Board board);
	
	//게시글 삭제 D
	public void deleteBoard(String no) ;
}
