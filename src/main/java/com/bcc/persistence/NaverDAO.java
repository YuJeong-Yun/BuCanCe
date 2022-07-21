package com.bcc.persistence;

import java.util.HashMap;

import com.bcc.domain.NaverVO;

public interface NaverDAO {
	
	public void naverInsert(HashMap<String, Object> apiResult);
	
	public NaverVO findnaver(HashMap<String, Object> apiResult);

}
