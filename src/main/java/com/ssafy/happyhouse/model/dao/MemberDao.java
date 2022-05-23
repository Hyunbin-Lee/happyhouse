package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.dto.PageBean;

@Mapper
public interface MemberDao {
	// 회원가입
	void register(Member member) throws SQLException;

	// 회원탈퇴
	void delete(String id) throws SQLException;

	// 로그인
	Member login(Map<String, String> map) throws SQLException;

	// 회원정보수정
	void modify(Member member) throws SQLException;

	// 마이페이지
	Member inquire(String id) throws SQLException;

	// 비밀번호 찾기
	String findPW(Map<String, String> map) throws SQLException;

	// 모든 게시글 검색 R
	public List<Member> searchAll(PageBean bean);

	public List<Member> searchAll2();

	// 총 게시글 수 검색 R
	public int count(PageBean bean);
}
