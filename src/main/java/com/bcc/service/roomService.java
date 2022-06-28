package com.bcc.service;

import org.json.simple.JSONArray;

public interface roomService {

	public JSONArray roomSearch();
	
	public JSONArray roomDetail(String bno);
	
}
