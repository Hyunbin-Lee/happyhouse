package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Qna;

public interface QnaService {
	public List<Qna> retrieveBoard();
	public Qna detailBoard(int articleno);
	public boolean writeBoard(Qna board);
	public boolean updateBoard(Qna board);
	public boolean deleteBoard(int articleno);
}
