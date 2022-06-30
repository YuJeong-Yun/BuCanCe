package com.bcc.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.bcc.domain.roomSearch;

public interface roomService {

	public JSONArray roomList();
	
	public JSONArray roomSearchList(roomSearch rs);
	
	public JSONArray roomDetail(String bno);

	public JSONObject roomReserve(String bno);
	
}
