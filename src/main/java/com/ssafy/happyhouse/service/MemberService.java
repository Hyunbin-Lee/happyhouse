package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.dto.PageBean;

public interface MemberService {
	//회원가입
	void register(Member member) throws SQLException;
	//회원탈퇴
	void delete(String id) throws SQLException;
	//로그인
	Member login(Map<String, String> map) throws SQLException;
	//회원정보수정
	void modify(Member member) throws SQLException;
	//마이페이
	Member inquire(String id) throws SQLException;
	//비밀번호 찾기 
	String findPW(Map<String, String> map) throws SQLException;
	//회원관리-리스트검색
	List<Member> searchAll(PageBean bean) throws SQLException;
}
