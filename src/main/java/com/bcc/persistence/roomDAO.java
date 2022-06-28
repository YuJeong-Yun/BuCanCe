package com.bcc.persistence;

import org.json.simple.JSONArray;

public interface roomDAO {

	public JSONArray roomDAO();
	
	public JSONArray roomDetailDAO(String bno);//상세정보
}
