package com.bcc.service;

import java.text.ParseException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.bcc.domain.roomDate;
import com.bcc.domain.roomPayVO;
import com.bcc.domain.roomSearch;

public interface roomService {

	public JSONArray roomList();
	
	public JSONArray roomSearchList(roomSearch rs);
	
	public JSONArray roomDetail0(String bno);
	
	public JSONArray roomDetail(String bno);

	public JSONArray roomDetail2(String bno);
	
	public JSONArray roomDetail3(String bno);
	
	public JSONArray roomDetail4(String bno);

	public JSONArray roomDetail5(String bno);
	
	public JSONArray roomPrice(String bno);

	public JSONArray roomReserve(String bno, roomDate rd,String ano) throws ParseException;

	public void roomPay(roomPayVO vo);
	
}
