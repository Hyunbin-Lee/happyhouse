package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.dto.Qna;
import com.ssafy.happyhouse.model.dao.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService {
	
    @Autowired
	private QnaMapper qnaMapper;

    @Override
	public List<Qna> retrieveBoard() {
		return qnaMapper.selectBoard();
	}
    
  	@Override
	public boolean writeBoard(Qna board) {
		return qnaMapper.insertBoard(board) == 1;
	}

	@Override
	public Qna detailBoard(int articleno) {
		return qnaMapper.selectBoardByNo(articleno);
	}

	@Override
	@Transactional
	public boolean updateBoard(Qna board) {
		return qnaMapper.updateBoard(board) == 1;
	}

	@Override
	@Transactional
	public boolean deleteBoard(int articleno) {
		return qnaMapper.deleteBoard(articleno) == 1;
	}
}