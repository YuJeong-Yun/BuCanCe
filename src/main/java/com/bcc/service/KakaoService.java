package com.bcc.service;

import java.util.HashMap;

public interface KakaoService {
	   
	// 카카오 관련
    // 토큰 받아오기
	public String getAccessToken (String authorize_code);
		
	public HashMap<String, Object> getUserInfo(String access_Token);
	
}