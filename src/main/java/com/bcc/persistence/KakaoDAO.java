package com.bcc.persistence;

import java.util.HashMap;

import com.bcc.domain.KakaoVO;

public interface KakaoDAO {
	
	public void putKakao(HashMap<String, Object> userInfo);
	
	public KakaoVO getKakao(HashMap<String, Object> userInfo);

}
