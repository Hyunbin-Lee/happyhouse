package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.model.dto.Qna;

public interface QnaService {
	// 게시글 작성 C
	public void insertQna(Qna qna);

	// 게시글답변 작성 C
	public void insertAs(Qna qna);

	// 번호로 게시글 검색 R
	public Qna search(String articleno);

	// 모든 게시글 검색 R
	public List<Qna> searchAll(PageBean bean);

	// 게시글 수정 U
	public void updateQna(Qna qna);

	// 게시글 삭제 D
	public void deleteQna(String articleno);

	// 게시글답변 수정 U
	void updateAs(Qna qna);
}
