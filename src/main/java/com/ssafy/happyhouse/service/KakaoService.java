package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.HashMap;

import com.ssafy.happyhouse.model.dto.Member;

public interface KakaoService {
	
	public String getReturnAccessToken(String code);
	
	public HashMap<String, Object> getUserInfo (String access_Token);
	
	public void getLogout(String access_token);

	void register(Member member) throws SQLException;
}
