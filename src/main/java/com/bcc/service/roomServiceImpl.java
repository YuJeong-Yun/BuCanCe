package com.bcc.service;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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

	
	
}
