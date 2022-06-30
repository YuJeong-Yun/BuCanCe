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
public class roomDAOImpl implements roomDAO {

	private static final Logger log = LoggerFactory.getLogger(roomDAOImpl.class);

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

	
	
	
	//크롤링한 결과를 목록선택과 검색을 통해 필요한 정보를 받아오는 동작
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
//			[log.info](http://log.info/)(room_title+"");

			
			//지역검색
			String[] areas = rs.getArea().split("/");
			String[] areaArr = rs.transArea(room_area);
			
			//제목검색
			String[] titleArr = rs.transTitle(room_title, rs.getPlace_name());
			String title = rs.getPlace_name();
			//제목검색
		
		//지역을 선택하지않은 경우
		if(rs.getArea().equals("favorite")) {	
			
		//입력한 숙소명을 통해 숙소명에 해당하는 정보만 크롤링
		for (int i = 0; i < room_title.size(); i++) {
			// JSONObject에 키:값 형태로 데이터 저장
			JSONObject obj = new JSONObject();

			if (titleArr[i].contains(title)) {

				
				obj.put("room_title", room_title.get(i).text());
				obj.put("room_pic", room_pic.get(i).attr("data-original"));
				obj.put("room_rank", room_rank.get(i).text());
				obj.put("room_area", room_area.get(i).text());
				obj.put("room_price", room_price.get(i).text());
				obj.put("room_price2", room_price2.get(i).text());
				obj.put("room_link", room_link.get(i).attr("href"));

				roomList.add(obj);

			} else if (title == null) {

				obj.put("room_title", room_title.get(i).text());
				obj.put("room_pic", room_pic.get(i).attr("data-original"));
				obj.put("room_rank", room_rank.get(i).text());
				obj.put("room_area", room_area.get(i).text());
				obj.put("room_price", room_price.get(i).text());
				obj.put("room_price2", room_price2.get(i).text());
				obj.put("room_link", room_link.get(i).attr("href"));

				roomList.add(obj);

			}

		}		//여기까지
		
		
		}
		else {//지역을 선택한경우
			
			
			//검색어는 입력하지않고 지역만 선택한 경우
			if(title == null) {
				for(int j = 0; j <areas.length; j++) {
				
					for (int i = 0; i < room_title.size(); i++) {
					// JSONObject에 키:값 형태로 데이터 저장
						JSONObject obj = new JSONObject();

						if (areaArr[i].contains(areas[j])) {

						
							obj.put("room_title", room_title.get(i).text());
							obj.put("room_pic", room_pic.get(i).attr("data-original"));
							obj.put("room_rank", room_rank.get(i).text());
							obj.put("room_area", room_area.get(i).text());
							obj.put("room_price", room_price.get(i).text());
							obj.put("room_price2", room_price2.get(i).text());
							obj.put("room_link", room_link.get(i).attr("href"));

							roomList.add(obj);
						} 
					}	
				}//String[] t3 = rs.transArea(room_area);
		}
		else {//숙소명을 선택후 검색어를 입력한 경우 숙소명과 검색어를 비교
			
			//지역검색
//			String[] areas = rs.getArea().split("/"); 입력받은 지역명을 나눈것
//			String[] areaArr = rs.transArea(room_area); 크롤링받은 지역명
			
			
				for(int j = 0; j <areas.length; j++) {
					
				for (int i = 0; i < room_title.size(); i++) {
					// JSONObject에 키:값 형태로 데이터 저장
					JSONObject obj = new JSONObject();

					if (areaArr[i].contains(areas[j])) {

						
						if(titleArr[i].contains(title)) {
						
							obj.put("room_title", room_title.get(i).text());
							obj.put("room_pic", room_pic.get(i).attr("data-original"));
							obj.put("room_rank", room_rank.get(i).text());
							obj.put("room_area", room_area.get(i).text());
							obj.put("room_price", room_price.get(i).text());
							obj.put("room_price2", room_price2.get(i).text());
							obj.put("room_link", room_link.get(i).attr("href"));

							roomList.add(obj);
//						log.info("받아온 검색어 : "+title+" 크롤링한 데이터 : "+ titleArr[i]);
						}
					} 

				}	
				
			}
		}
			
		}
		
		
		System.out.println(" roomList : " + roomList);
		
		return roomList;
}
		
	
	
	
	
	
	
	//방목록에서 사진클릭시 상세정보 페이지
	@Override
		public JSONArray roomDetailDAO(String bno) {

		log.info("크롤링 처리불러오기");

		// Jsoup를 이용해서 크롤링 - 여기어때
		// String url =
		// "https://www.goodchoice.kr/product/detail?ano=61754&adcno=2&sel_date=2022-06-27&sel_date2=2022-06-30";
		// // 크롤링할 url지정
		String url = bno;
		Document doc = null; // Document에 페이지의 전체 소스가 저장됨

		try {
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// select를 이용하여 원하는 태그를 선택
		Elements room_title = doc.select(".info h2");
//	Elements room_pic0 = doc.select(".gallery_pc  >li:nth-child(0)"); 
		Elements room_pic = doc.select(".gallery_pc .swiper-lazy");

		Elements room_address = doc.select(".info .address");
		Elements room_service = doc.select(".gra_mint_2");
		Elements room_comment = doc.select(".default_info .comment_mobile");
		Elements room_info = doc.select(".default_info > ul:nth-child(9)");
		Elements room_infoa = doc.select(".default_info > ul:nth-child(11)");
		// Elements room_map =doc.select(".map");
		Elements room_retitle = doc.select(".guest .best_review");
		// Elements room_review = doc.select(".guest > div.txt");//아직안됨
		Elements room_prices = doc.select(".table_wrap .best_review");
		
		
		
		// JSON 형태로 영화 정보 저장
		JSONArray detailList = new JSONArray();

		for (int i = 0; i < room_title.size(); i++) {
			// JSONObject에 키:값 형태로 데이터 저장
			JSONObject obj = new JSONObject();

			obj.put("room_title", room_title.get(i).text());
			// obj.put("room_pic0", room_pic0.get(i).attr("src"));
			obj.put("room_pic", room_pic.get(i).attr("data-src"));
			obj.put("room_address", room_address.get(i).text());
			obj.put("room_service", room_service.get(i).text());
			obj.put("room_comment", room_comment.get(i).text());
			obj.put("room_info", room_info.get(i).text());
			obj.put("room_infoa", room_infoa.get(i).text());
			// obj.put("room_map", room_map.get(i).attr("google_maps"));
			obj.put("room_retitle", room_retitle.get(i).text());
			// obj.put("room_review", room_review.get(i).text());
			// roomList에 생성한 JSONObject 추가
//				log.info(obj+"");
			detailList.add(obj);
		}
		System.out.println(" detailList : " + detailList);

		return detailList;
	}




	@Override
	public JSONArray roomReserveDAO(String bno) {
		

		// Jsoup를 이용해서 크롤링 - 여기어때
				String url = "https://www.goodchoice.kr/product/detail?ano=66536&adcno=1&sel_date=2022-06-30&sel_date2=2022-07-01";

				Document doc = null; // Document에 페이지의 전체 소스가 저장됨

				try {
					doc = Jsoup.connect(url).get();

				} catch (IOException e) {
					e.printStackTrace();
				}
				
				Elements room_grade //객실등급
				= doc.select(".table_wrap > .normal_day > .table_type_02 > tbody > tr > td:first-child");
				
				Elements room_price1 //객실등급
				= doc.select(".table_wrap > .normal_day > .table_type_02 > tbody > tr > td:nth-child(2) > span");
				Elements room_price2 //객실등급
				= doc.select(".table_wrap > .normal_day > .table_type_02 > tbody > tr > td:nth-child(2) > span");
				Elements room_price3 //객실등급
				= doc.select(".table_wrap > .normal_day > .table_type_02 > tbody > tr > td:nth-child(2) > span");
				Elements room_price4 //객실등급
				= doc.select(".table_wrap > .normal_day > .table_type_02 > tbody > tr > td:nth-child(2) > span");

				
				// JSON 형태로 숙소 가격 정보 불러오기
				JSONArray reserveList = new JSONArray();
				

				// JSONObject에 키:값 형태로 데이터 저장
				roomSearch rs = new roomSearch();
					
				String[] ab = rs.transPrice(room_grade);
				String[] ab2 = rs.transPrice(room_price1);
				String[] ab3 = rs.transPrice(room_price2);
				String[] ab4 = rs.transPrice(room_price3);
				String[] ab5 = rs.transPrice(room_price4);
					
				for(int i =0; i<ab.length-1; i++){
					JSONObject obj = new JSONObject();
						
					obj.put("room_grade", ab[i]);
					obj.put("room_price1", ab2[i]);
					obj.put("room_price2", ab3[i]);
					obj.put("room_price3", ab4[i]);
					obj.put("room_price4", ab5[i]);
					
					
					System.out.println(obj);
						
					reserveList.add(obj);
				}
					
					
					
					
					
				System.out.println(" reserveList : " + reserveList);

		return reserveList;
	}

	
	
	
	
	
	
	
	
}


