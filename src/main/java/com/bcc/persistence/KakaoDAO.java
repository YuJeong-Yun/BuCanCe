package com.bcc.persistence;

import java.util.HashMap;

import com.bcc.domain.MemberVO;

public interface KakaoDAO {
	
	public void putKakao(HashMap<String, Object> userInfo);
	
	public MemberVO getKakao(HashMap<String, Object> userInfo);

}
