package com.ssafy.happyhouse.service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.BoardDao;
import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.util.PageUtility;

@Service
public class BoardServiceImp implements BoardService {

	@Autowired
	BoardDao dao;

	private Logger logger = LoggerFactory.getLogger(BoardServiceImp.class);

	@Override
	public void insertBoard(Board board) {
		logger.info("insert ========================== board {}", board);
		dao.insertBoard(board);
	}

	@Override
	public Board search(String no) {
		logger.info("search ========================== board {}", no);
		return dao.search(no);
	}

	@Override
	public List<Board> searchAll(PageBean bean) {
		logger.info("bean ========================== bean {}", bean);
		if (bean.getWord()!=null&&!bean.getWord().equals("")&&bean.getKey().equals("no")) {
			List<Board> list = dao.searchAll2();
			logger.info("listAll ========================== list {}", list);

			// 이분탐색으로 빨리 찾기!!! (no로 정렬된 데이터라고 가정한다.)
			List<Board> answer=new ArrayList<Board>();
			int target = Integer.parseInt(bean.getWord());
			int start = 0;
			int end = list.size() - 1;
			int mid;
			while (start <= end) {
				mid = (start + end) / 2;

				if (list.get(mid).getNo() > target) {
					end = mid - 1;

				} else if (list.get(mid).getNo() == target) {
					answer.add(list.get(mid));
					return answer;

				} else {
					start = mid + 1;
				}
			}
			return answer;

		}

		int total = dao.count(bean);
		logger.info("searchAll ========================== total {}", total);
		PageUtility bar = new PageUtility(bean.getInterval(), total, bean.getPageNo(), "");
		bean.setPageLink(bar.getPageBar());
		List<Board> list;

		list = dao.searchAll(bean);

		// 정렬 알고리즘 수행 .

		logger.info("searchAll ========================== Board list {}", list);
		return list;
	}

	@Override
	public void updateBoard(Board board) {
		dao.updateBoard(board);
	}

	@Override
	public void deleteBoard(String no) {
		dao.deleteBoard(no);
	}

}
