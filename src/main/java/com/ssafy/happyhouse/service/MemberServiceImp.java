package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.MemberDao;
import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.util.PageUtility;
@Service
public class MemberServiceImp implements MemberService {
	@Autowired
	MemberDao memberDao;
	
	@Override
	public void register(Member member) throws SQLException {
		memberDao.register(member);
	}

	@Override
	public void delete(String id) throws SQLException {
		memberDao.delete(id);

	}

	@Override
	public Member login(Map<String, String> map) throws SQLException {
		return memberDao.login(map);
	}

	@Override
	public void modify(Member member) throws SQLException{
		memberDao.modify(member);

	}

	@Override
	public Member inquire(String id) throws SQLException {
		return memberDao.inquire(id);
	}

	@Override
	public String findPW(Map<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return memberDao.findPW(map);
	}
	
	@Override
	public List<Member> searchAll(PageBean bean) {
		if (bean.getWord()!=null&&!bean.getWord().equals("")&&bean.getKey().equals("articleno")) {
			List<Member> list = memberDao.searchAll2();

			// 이분탐색으로 빨리 찾기!!! (no로 정렬된 데이터라고 가정한다.)
			List<Member> answer=new ArrayList<Member>();
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

		int total = memberDao.count(bean);
		PageUtility bar = new PageUtility(bean.getInterval(), total, bean.getPageNo(), "");
		bean.setPageLink(bar.getPageBar());
		List<Member> list;

		list = memberDao.searchAll(bean);

		// 정렬 알고리즘 수행 .

		return list;
	}

}
