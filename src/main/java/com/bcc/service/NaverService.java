package com.bcc.service;

import com.bcc.domain.NaverVO;

public interface NaverService {
	   
	// 네이버 관련
    // 토큰 받아오기
	public String getAccessToken (String authorize_code);
		
	public NaverVO getUserInfo(String access_Token);
	
}