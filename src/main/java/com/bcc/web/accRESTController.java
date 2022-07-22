package com.bcc.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bcc.domain.HotelVO;
import com.bcc.domain.roomSearch;
import com.bcc.service.roomService;

@RestController
@RequestMapping("/accREST/*")
public class accRESTController {

	
	private static final Logger log = LoggerFactory.getLogger(accRESTController.class);
	
	
	@Inject
	private roomService service;
	
	
	// 숙소 정보 크롤링
	@RequestMapping(value = "/roomList", method = RequestMethod.POST)
	public List roomListPOST() throws Exception{

		
		return service.getRoomList();
	}
	
	
	// 숙소 정보 검색 크롤링
		@RequestMapping(value = "/roomSearch", method = RequestMethod.POST)
		public List roomSearchPOST(roomSearch rs) throws Exception{
			
			log.info("rs : "+rs);
			
			return service.getRoomSearchList(rs);
		}
	
}
