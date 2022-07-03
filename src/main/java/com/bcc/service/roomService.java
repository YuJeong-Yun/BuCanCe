package com.bcc.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.bcc.domain.roomDate;
import com.bcc.domain.roomSearch;

public interface roomService {

	public JSONArray roomList();
	
	public JSONArray roomSearchList(roomSearch rs);
	
	public JSONArray roomDetail(String bno);

	public JSONArray roomPrice(String bno);

	JSONArray roomReserve(String bno, roomDate rd,String ano);
	
}
