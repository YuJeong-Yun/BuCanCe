package com.bcc.web;

import java.io.IOException;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bcc.domain.roomSearch;
import com.bcc.service.roomService;

//숙박컨트롤러 
@Controller
@RequestMapping("/accomodation/*")
public class accomodationController {

	private static final Logger log = LoggerFactory.getLogger(accomodationController.class);

	@Inject
	private roomService service;
	


	// roomList 페이지 방목록페이지
	// http://localhost:8088/accomodation/roomList
	@RequestMapping(value = "/roomList", method = RequestMethod.GET)
	public void roomListGET(Model model) throws IOException {

		log.info(" roomListGET() 호출 ");

		
			JSONArray roomList = service.roomList();

			model.addAttribute("roomList", roomList);

	
	
		
	}
	
	// roomList 페이지 방목록검색
	// http://localhost:8088/accomodation/roomList
	@RequestMapping(value = "/roomList", method = RequestMethod.POST)
	public void roomListPOST(Model model,roomSearch rs) throws IOException {

		log.info(" roomListPOST() 호출 ");

		
		
		JSONArray roomList = service.roomSearchList(rs);
//
		model.addAttribute("roomList", roomList);
		model.addAttribute("select_area", rs.getArea() );
		model.addAttribute("select_place", rs.getPlace_name() );
		
		
			
	}
	
	

	
	// 방정보상세보기
	// roomDetail 페이지
		// http://localhost:8088/accomodation/roomDetail
		@RequestMapping(value = "/roomDetail" ,method = RequestMethod.GET)
		public void roomDetailGET(Model model,@RequestParam("bno")
		String bno) throws IOException {

			log.info("roomDetailGET() 호출");


			JSONArray roomdetail = service.roomDetail(bno);
				
			model.addAttribute("roomdetail", roomdetail);
			model.addAttribute("bno", bno);
		}
	
	
		
		
		// 예약 roomReserve 페이지
		// http://localhost:8088/accomodation/roomReserve
		@RequestMapping(value = "/roomReserve" ,method = RequestMethod.GET)
			public void roomReserveGET(Model model,@RequestParam("bno")
			String bno) throws IOException {

			log.info("roomReserveGET() 호출");


			JSONObject roomReserve = service.roomReserve(bno);
			
			model.addAttribute("roomReserve", roomReserve);
			
		
	}
}
