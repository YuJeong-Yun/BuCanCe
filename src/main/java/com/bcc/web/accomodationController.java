package com.bcc.web;

import java.io.IOException;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.jsoup.nodes.Document;
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
	
	
	// roomSearch 페이지
	// http://localhost:8088/accomodation/roomSearch
	@RequestMapping(value = "/roomSearch", method = RequestMethod.GET)
	public void roomSearchGET(Model model) throws IOException {
		log.info(" roomSearchGET() 호출 ");

		// 서비스 주입

		// roomSearch 페이지
		// http://localhost:8088/accomodation/roomSearch
//			@RequestMapping(value = "/roomSearch",method = RequestMethod.GET)
//			public void roomSearchGET(Model model) throws IOException {
//				log.info(" roomSearchGET() 호출 ");
//				
//				String url ="https://finance.naver.com/item/main.naver?code=377300";
//				
//				Document doc = Jsoup.connect(url).get();
//				
//				Elements e1 = doc.getElementsByAttributeValue("class", "ResizableImage_image__1_8js SingleImage_horizontal__2SBaY");
////				Element e2 = e1.get(0);
////				Elements e3 = e2.select("span");
//				//ㅇㅇ
//				log.info(e1.html()+"");
////				log.info(e1.get(0)+"");
////				log.info(e2.select("span")+"");
//				
////				log.info(e3.get(0).text()+"");
//				
////				model.addAttribute("e3", e3);
//				

	}

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
		
		
			
	}
	
	
	
	// roomInfo 페이지 방정보페이지
	// http://localhost:8088/accomodation/roomInfo
	@RequestMapping(value = "/roomInfo", method = RequestMethod.GET)
	public void roomInfoGET(Model model,@RequestParam("bno") String bno) throws IOException {

			log.info(" roomInfoGET() 호출 ");

			// Jsoup를 이용해서 크롤링 - 여기어때
			String url = bno;

			log.info(url);

		}
	
	
	

}
