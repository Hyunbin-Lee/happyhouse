package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Member;
@Mapper
public interface MemberDao {
	//회원가입
	void register(Member member) throws SQLException;
	//회원탈퇴
	void delete(String id) throws SQLException;
	//로그인
	Member login(Map<String, String> map) throws SQLException;
	//회원정보수정
	void modify(Member member)throws SQLException;
	//마이페이
	Member inquire(String id) throws SQLException;
	String findPW(Map<String, String> map)throws SQLException;

}
