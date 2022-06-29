package com.bcc.persistence;

import java.io.IOException;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

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
//	Elements room_pic0 = doc.select(".gallery_pc  >li:nth-child(0)"); //순차선택자이용해서 해야되는데 잘안된다 하.
		Elements room_pic = doc.select(".gallery_pc .swiper-lazy");

		Elements room_address = doc.select(".info .address");
		Elements room_service = doc.select(".gra_mint_2");
		Elements room_comment = doc.select(".default_info .comment_mobile");
		Elements room_info = doc.select(".default_info > ul:nth-child(9)");
		Elements room_infoa = doc.select(".default_info > ul:nth-child(11)");
		// Elements room_map =doc.select(".map");
		Elements room_retitle = doc.select(".guest .best_review");
		// Elements room_review = doc.select(".guest > div.txt");//아직안됨
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

}
