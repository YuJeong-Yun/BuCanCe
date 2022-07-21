package com.bcc.service;

import com.bcc.domain.KakaoVO;

public interface KakaoService {
	   
	// 카카오 관련
    // 토큰 받아오기
	public String getAccessToken (String authorize_code);
		
	public KakaoVO getUserInfo(String access_Token);
	
}