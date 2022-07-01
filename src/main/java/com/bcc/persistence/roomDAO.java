package com.bcc.persistence;

import org.json.simple.JSONArray;

public interface roomDAO {

	public JSONArray roomDAO();
	
	public JSONArray roomDetailDAO(String bno);//상세정보
   
	public JSONArray roomDetailDAO2(String bno);//상세정보 (서비스)

	public JSONArray roomDetailDAO3(String bno);//상세정보 ( 주의사항)

	public JSONArray roomDetailDAO4(String bno);//상세정보 (주변안내)

	public JSONArray roomDetailDAO5(String bno);// 상세정보 (상세정보)
}
