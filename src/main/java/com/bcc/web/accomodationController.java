package com.bcc.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.mysql.cj.xdevapi.JsonArray;

//숙박컨트롤러 
@Controller
@RequestMapping("/accomodation/*")
public class accomodationController {

	private static final Logger log =
			LoggerFactory.getLogger(accomodationController.class);

		// roomSearch 페이지
		// http://localhost:8088/accomodation/roomSearch
		@RequestMapping(value = "/roomSearch",method = RequestMethod.GET)
		public void roomSearchGET(Model model) throws IOException {
			log.info(" roomSearchGET() 호출 ");
			
			//서비스 주입
			
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
	
		//roomList 페이지
		// http://localhost:8088/accomodation/roomList
		@RequestMapping(value = "/roomList",method = RequestMethod.GET)
		public void roomListGET(Model model) throws IOException {
			
			log.info(" roomListGET() 호출 ");
			
			// Jsoup를 이용해서 크롤링 - 여기어때
//						String url = "https://www.goodchoice.kr/product/detail?ano=61754&adcno=2&sel_date=2022-06-27&sel_date2=2022-06-30"; // 크롤링할 url지정
						String url = "https://www.goodchoice.kr/product/home/12";
						
						
						Document doc = null; // Document에 페이지의 전체 소스가 저장됨
						
						
						try {
								doc = Jsoup.connect(url).get();
								 
							} catch (IOException e) {
								e.printStackTrace();
							}
						
							// select를 이용하여 원하는 태그를 선택
							Elements room_title = doc.select(".list_2.adcno1 .name strong");
							Elements room_pic = doc.select(".pic .lazy.align");
							Elements room_star = doc.select(".name > p.score");
							Elements room_area = doc.select(".name > p:last-child");
							Elements room_price = doc.select(".map_html > p:nth-child(1)");
							Elements room_price2 = doc.select(".map_html > p:nth-child(2)");
							// JSON 형태로 영화 정보 저장
							JSONArray roomList = new JSONArray();
							
							for (int i = 0; i < room_title.size(); i++) {
					        	// JSONObject에 키:값 형태로 데이터 저장
								JSONObject obj = new JSONObject();
								
								obj.put("room_title", room_title.get(i).text());
								obj.put("room_pic", room_pic.get(i).attr("data-original"));
								obj.put("room_star", room_star.get(i).text());
								obj.put("room_area", room_area.get(i).text());
								obj.put("room_price", room_price.get(i).text());
								obj.put("room_price2", room_price2.get(i).text());
								
								
								// roomList에 생성한 JSONObject 추가
//								log.info(obj+"");
								roomList.add(obj);
							}
							 System.out.println(" roomList : " + roomList);
							 
							 
							 
							 model.addAttribute("roomList", roomList);
							 
							 
							 
							
								} 
							 
							 
						}
					
					
		
		
		
			
						
			
		
	
		
	
