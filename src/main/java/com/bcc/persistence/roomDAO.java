package com.bcc.persistence;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestParam;

import com.bcc.domain.roomDate;
import com.bcc.domain.roomSearch;

public interface roomDAO {

	public JSONArray roomDAO();

	public JSONArray roomDAO(roomSearch rs);
	
	public JSONArray roomDetailDAO(String bno);

	public JSONArray roomPriceDAO(String bno);

	public JSONArray roomReserveDAO(String bno,roomDate rd,String ano);
}
