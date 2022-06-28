package com.bcc.service;

import org.json.simple.JSONArray;

import com.bcc.domain.roomSearch;

public interface roomService {

	public JSONArray roomList();
	
	public JSONArray roomSearchList(roomSearch rs);
	
}
