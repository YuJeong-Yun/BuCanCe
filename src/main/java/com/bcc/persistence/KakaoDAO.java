package com.bcc.persistence;

import java.util.HashMap;

import com.bcc.domain.KakaoVO;

public interface KakaoDAO {
	
	public void kakaoInsert(HashMap<String, Object> userInfo);
	
	public KakaoVO findkakao(HashMap<String, Object> userInfo);

}
