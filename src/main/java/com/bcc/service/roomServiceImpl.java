package com.bcc.service;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.roomDate;
import com.bcc.domain.roomSearch;
import com.bcc.persistence.roomDAO;

@Service
public class roomServiceImpl implements roomService{

	// DAO 객체 주입
	@Inject
	private roomDAO dao;
	
	private static final Logger log =
			LoggerFactory.getLogger(roomServiceImpl.class);
	
	@Override
	public JSONArray roomList() {
		
		JSONArray roomList = dao.roomDAO();
		
		 return roomList;
	}

	@Override
	public JSONArray roomSearchList(roomSearch rs) {

		JSONArray roomList = dao.roomDAO(rs);
		
		
		return roomList;
	}

	@Override
	public JSONArray roomDetail(String bno) {

		JSONArray detailList =dao.roomDetailDAO(bno);
		return detailList;
	}

	@Override
	public JSONArray roomDetail2(String bno) {
		JSONArray detailList2 = dao.roomDetailDAO2(bno);
		return detailList2;
	}

	@Override
	public JSONArray roomDetail3(String bno) {
		JSONArray detailList3 = dao.roomDetailDAO3(bno);
		return detailList3;
	}

	@Override
	public JSONArray roomDetail4(String bno) {
		JSONArray detailList4 = dao.roomDetailDAO4(bno);
		return detailList4;
	}

	@Override
	public JSONArray roomDetail5(String bno) {
		JSONArray detailList5 = dao.roomDetailDAO5(bno);
		return detailList5;
	}
	
	
	
	@Override
	public JSONArray roomPrice(String bno) {

		JSONArray PriceList =dao.roomPriceDAO(bno);
		
		return PriceList;
	}
	
	
	@Override
	public JSONArray roomReserve(String bno,roomDate rd,String ano) {

		JSONArray reserveList =dao.roomReserveDAO(bno,rd,ano);
		
		return reserveList;
	}
	
}
