package com.bcc.web;

import java.io.IOException;
import java.text.ParseException;

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

import com.bcc.domain.roomDate;
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


			log.info(bno);
			JSONArray roomdetail0 = service.roomDetail0(bno);
			JSONArray roomdetail = service.roomDetail(bno);
			JSONArray roomdetail2 = service.roomDetail2(bno);
			JSONArray roomdetail3 = service.roomDetail3(bno);
			JSONArray roomdetail4 = service.roomDetail4(bno);
			JSONArray roomdetail5 = service.roomDetail5(bno);
			
			
			model.addAttribute("roomdetail0", roomdetail0);
			model.addAttribute("roomdetail", roomdetail);
			model.addAttribute("roomdetail2", roomdetail2);
			model.addAttribute("roomdetail3", roomdetail3);
			model.addAttribute("roomdetail4", roomdetail4);
			model.addAttribute("roomdetail5", roomdetail5);
			
			model.addAttribute("bno", bno);
			
			
			int ano_idx = bno.indexOf("ano=");
			
			log.info(ano_idx+"");
			
			String cc = bno.substring(ano_idx+4,bno.length());
			
			log.info(cc);
			model.addAttribute("ano", cc);
			
			
			
			
		}
	
	
		
		
		// 가격상세정보 roomPrice 페이지
		// http://localhost:8088/accomodation/roomPrice
		@RequestMapping(value = "/roomPrice" ,method = RequestMethod.GET)
			public void roomPriceGET(Model model,@RequestParam("bno")
			String bno) throws IOException {

			log.info("roomPriceGET() 호출");
				

			JSONArray roomPrice = service.roomPrice(bno);
			
			
			
			model.addAttribute("roomPrice", roomPrice);
			
		
	}
		
		
		
		// 예약 roomReserve 페이지
		// http://localhost:8088/accomodation/roomReserve 
		@RequestMapping(value = "/roomReserve" ,method = RequestMethod.GET)
			public void roomReserveGET(Model model,@RequestParam("bno")
			String bno,roomDate rd,
			@RequestParam("ano") String ano) throws IOException, ParseException {
			
			log.info("roomReserveGET() 호출");

			//날짜정보가져오기
			log.info(rd.getSel_date());
			log.info(rd.getSel_date2());
			model.addAttribute("bno", bno);
			
//			
			JSONArray roomReserve = service.roomReserve(bno,rd,ano);

			model.addAttribute("roomReserve", roomReserve);
				
			}
		
		
		
		
		
}
