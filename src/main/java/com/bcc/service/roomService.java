package com.bcc.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.bcc.domain.roomDate;
import com.bcc.domain.roomPayVO;
import com.bcc.domain.roomReVO;
import com.bcc.domain.roomRefundVO;
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

	public roomPayVO roomPayInfo(String accId);

	public List<roomPayVO> roomUserPayInfo(String userId);

	public String SearchPayId();

	public void payStatus(String accId);


	public void inRoomRefund(roomRefundVO vo2);

	public String roomRf();

	public String payRefund(roomPayVO vo2) throws MalformedURLException, IOException, org.json.simple.parser.ParseException;
	
	
	
	
}
