package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.model.dto.Qna;

@Mapper
public interface QnaDao {
	// 게시글 작성 C
	public void insertQna(Qna qna);

	// 게시글답변 작성 C
	public void answerQna(Qna qna);

	// 번호로 게시글 검색 R
	public Qna search(String articleno);

	// 모든 게시글 검색 R
	public List<Qna> searchAll(PageBean bean);

	public List<Qna> searchAll2();

	// 총 게시글 수 검색 R
	public int count(PageBean bean);

	// 게시글 수정 U
	public void updateQna(Qna qna);

	// 게시글 삭제 D
	public void deleteQna(String articleno);
}
