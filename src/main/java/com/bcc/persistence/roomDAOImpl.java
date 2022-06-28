package com.bcc.persistence;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bcc.domain.roomSearch;

@Repository
public class roomDAOImpl implements roomDAO{

	
	private static final Logger log =
			LoggerFactory.getLogger(roomDAOImpl.class);
	
	
	
	@Override
	public JSONArray roomDAO() {
		
		log.info("크롤링 처리불러오기");
		
		// Jsoup를 이용해서 크롤링 - 여기어때
//		String url = "https://www.goodchoice.kr/product/detail?ano=61754&adcno=2&sel_date=2022-06-27&sel_date2=2022-06-30"; // 크롤링할 url지정
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
			Elements room_rank = doc.select(".name p.score");
			Elements room_area = doc.select(".name > p:last-child");
			Elements room_price = doc.select(".map_html > p:nth-child(1)");
			Elements room_price2 = doc.select(".map_html > p:nth-child(2)");
			Elements room_link = doc.select(".list_2.adcno1 > a");
			// JSON 형태로 영화 정보 저장
			JSONArray roomList = new JSONArray();
			
			for (int i = 0; i < room_title.size(); i++) {
	        	// JSONObject에 키:값 형태로 데이터 저장
				JSONObject obj = new JSONObject();
				
				obj.put("room_title", room_title.get(i).text());
				obj.put("room_pic", room_pic.get(i).attr("data-original"));
				obj.put("room_rank", room_rank.get(i).text());
				obj.put("room_area", room_area.get(i).text());
				obj.put("room_price", room_price.get(i).text());
				obj.put("room_price2", room_price2.get(i).text());
				obj.put("room_link", room_link.get(i).attr("href"));
				
				
				// roomList에 생성한 JSONObject 추가
//				log.info(obj+"");
				roomList.add(obj);
			}
			 System.out.println(" roomList : " + roomList);
		
		
			 return roomList;
	}



	@Override
	public JSONArray roomDAO(roomSearch rs) {
		
		
		log.info("크롤링을 검색한 결과불러오기");
		
		// Jsoup를 이용해서 크롤링 - 여기어때
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
			Elements room_rank = doc.select(".name p.score");
			Elements room_area = doc.select(".name > p:last-child");
			Elements room_price = doc.select(".map_html > p:nth-child(1)");
			Elements room_price2 = doc.select(".map_html > p:nth-child(2)");
			Elements room_link = doc.select(".list_2.adcno1 > a");
			// JSON 형태로 영화 정보 저장
			JSONArray roomList = new JSONArray();
			
//			log.info(room_title+"");
			List list = new ArrayList();
			list.add(room_title);
			
			Iterator tt = list.iterator();
			
			String[] t1 = {};
			int a =0;
			while(tt.hasNext()){
				t1[a] = "dd";
//				(String)tt.next()
				a++;
			    }
		
			log.info(t1[1]);


			
//			배열 들어가는지 -> 꺼낸 데이터만 비교 안되면 list에서 string으로 캐스팅
			
//			for (int i = 0; i < room_title.size(); i++) {
//	        	// JSONObject에 키:값 형태로 데이터 저장
//				JSONObject obj = new JSONObject();
//				
//				
//				if(tt2.contains(t1[i])) {
//				
//					obj.put("room_title", room_title.get(i).text());
//					obj.put("room_pic", room_pic.get(i).attr("data-original"));
//					obj.put("room_rank", room_rank.get(i).text());
//					obj.put("room_area", room_area.get(i).text());
//					obj.put("room_price", room_price.get(i).text());
//					obj.put("room_price2", room_price2.get(i).text());
//					obj.put("room_link", room_link.get(i).attr("href"));
//					
//				}
//				
//				
//				// roomList에 생성한 JSONObject 추가
////				log.info(obj+"");
//				roomList.add(obj);
//			}
//			 System.out.println(" roomList : " + roomList);
//		
		
			 return roomList;
	}

	
	
	
	
	
	
	
	
}
