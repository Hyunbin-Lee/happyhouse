package com.ssafy.happyhouse.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.QnaDao;
import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.model.dto.Qna;
import com.ssafy.happyhouse.util.PageUtility;

@Service
public class QnaServiceImp implements QnaService {

	@Autowired
	QnaDao dao;

	private Logger logger = LoggerFactory.getLogger(QnaServiceImp.class);

	@Override
	public void insertQna(Qna qna) {
		logger.info("insert ========================== qna {}", qna);
		dao.insertQna(qna);
	}
	
	@Override
	public void answerQna(Qna qna) {
		logger.info("answer ========================== qna {}", qna);
		dao.answerQna(qna);
	}

	@Override
	public Qna search(String articleno) {
		logger.info("search ========================== qna {}", articleno);
		return dao.search(articleno);
	}

	@Override
	public List<Qna> searchAll(PageBean bean) {
		logger.info("bean ========================== bean {}", bean);
		if (bean.getWord()!=null&&!bean.getWord().equals("")&&bean.getKey().equals("articleno")) {
			List<Qna> list = dao.searchAll2();
			logger.info("listAll ========================== list {}", list);

			// 이분탐색으로 빨리 찾기!!! (no로 정렬된 데이터라고 가정한다.)
			List<Qna> answer=new ArrayList<Qna>();
			int target = Integer.parseInt(bean.getWord());
			int start = 0;
			int end = list.size() - 1;
			int mid;
			while (start <= end) {
				mid = (start + end) / 2;

				if (list.get(mid).getArticleno() > target) {
					end = mid - 1;

				} else if (list.get(mid).getArticleno() == target) {
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
		List<Qna> list;

		list = dao.searchAll(bean);

		// 정렬 알고리즘 수행 .

		logger.info("searchAll ========================== qna list {}", list);
		return list;
	}

	@Override
	public void updateQna(Qna qna) {
		dao.updateQna(qna);
	}

	@Override
	public void deleteQna(String articleno) {
		dao.deleteQna(articleno);
	}

}
