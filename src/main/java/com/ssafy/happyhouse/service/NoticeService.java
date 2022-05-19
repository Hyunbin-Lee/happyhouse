package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Board;

public interface NoticeService {
	void registerNotice(Board noticeDto) throws Exception;
	void updateNotice(Board noticeDto) throws Exception;
	void deleteNotice(int noticeNo) throws Exception;
	List<Board> listNotice(String pg, String key, String word) throws Exception;
}
