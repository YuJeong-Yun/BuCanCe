package com.bcc.persistence;

import org.json.simple.JSONArray;

import com.bcc.domain.roomSearch;

public interface roomDAO {

	public JSONArray roomDAO();

	public JSONArray roomDAO(roomSearch rs);
	
	public JSONArray roomDetailDAO(String bno);

	public JSONArray roomReserveDAO(String bno);
}
