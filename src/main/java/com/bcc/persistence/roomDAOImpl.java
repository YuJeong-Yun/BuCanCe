package com.bcc.persistence;

import java.io.IOException;
import java.util.Stack;

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

		Elements room_title = doc.select(".info h2"); // 1. 제목
		Elements room_pic = doc.select(".gallery_pc .swiper-lazy"); // 2. 대표사진
		Elements room_pica = doc.select(".lazy"); // 3.(서브)사진
	//	Elements room_picb = doc.select(".gallery_m index_mobile > div:nth-child(3)"); // 3. (서브)사진2
		// Elements room_star =doc.select(".score_wrap .score_star star_45");//별점 사진

		Elements room_star_num = doc.select(".score_cnt span");// 4.별점(숫자)
		Elements room_address = doc.select(".info .address"); // 5. 주소
		Elements room_retitle = doc.select(".guest .best_review");// 10.리뷰 제목(추후 삭제 예정?)

		// Elements room_review = doc.select(".guest > div.txt");//11.리뷰(10번이랑 추후삭제도가능)
		// Elements room_map =doc.select(".map");//지도

		// JSON 형태로 영화 정보 저장

		JSONArray detailList = new JSONArray();

		for (int i = 0; i < room_title.size(); i++) {
			// JSONObject에 키:값 형태로 데이터 저장
			JSONObject obj = new JSONObject();

			obj.put("room_title", room_title.get(i).text());
			obj.put("room_pic", room_pic.get(i).attr("data-src"));
			obj.put("room_pica", room_pica.get(i).attr("data-original"));
		//	obj.put("room_picb", room_picb.get(i).attr("src"));
			// obj.put("room_star", room_star.get(i).attr("png"));
			obj.put("room_star_num", room_star_num.get(i).text());
			obj.put("room_address", room_address.get(i).text());
//
//			obj.put("room_service", room_service.get(i).text());
//
//			obj.put("room_comment", room_comment.get(i).text());
//
//			obj.put("room_info", room_info.get(i).text());
//			obj.put("room_infoa", room_infoa.get(i).text());
			obj.put("room_retitle", room_retitle.get(i).text());

			// obj.put("room_map", room_map.get(i).attr("google_maps"));
			// obj.put("room_review", room_review.get(i).text());
			// roomList에 생성한 JSONObject 추가
//				log.info(obj+"");
			detailList.add(obj);

		}
		System.out.println(" detailList : " + detailList);

		return detailList;

	}// for

	@Override
	public JSONArray roomDetailDAO2(String bno) {

		log.info("크롤링 서비스값 불러오기");

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

		Elements room_service = doc.select(".gra_mint_2"); // 6. 서비스

		// JSON 형태로 영화 정보 저장

		JSONArray detailList2 = new JSONArray();

		for (int i = 0; i < room_service.size(); i++) {
			// JSONObject에 키:값 형태로 데이터 저장
			JSONObject obj2 = new JSONObject();

			obj2.put("room_service", room_service.get(i).text());

			// roomList에 생성한 JSONObject 추가
//				log.info(obj+"");
			detailList2.add(obj2);

		}
		System.out.println(" detailList2 : " + detailList2);

		return detailList2;

	}// for

	@Override
	public JSONArray roomDetailDAO3(String bno) {

		log.info("크롤링  코멘트 처리불러오기");

		String url = bno;

		Document doc = null;

		try {
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements room_comment = doc.select(".default_info .comment_mobile"); // 7.코맨트(사장님말씀)

		JSONArray detailList3 = new JSONArray();

		for (int i = 0; i < room_comment.size(); i++) {
			JSONObject obj = new JSONObject();

			obj.put("room_comment", room_comment.get(i).text());

			detailList3.add(obj);

		}
		System.out.println(" detailList3 : " + detailList3);

		return detailList3;

	}// for

	@Override
	public JSONArray roomDetailDAO4(String bno) {

		log.info("크롤링 처리불러오기");

		String url = bno;

		Document doc = null; // Document에 페이지의 전체 소스가 저장됨

		try {
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements room_info = doc.select(".default_info > ul:nth-child(9)"); // 8.주변안내

		JSONArray detailList4 = new JSONArray();

		for (int i = 0; i < room_info.size(); i++) {
			// JSONObject에 키:값 형태로 데이터 저장
			JSONObject obj = new JSONObject();

			obj.put("room_info", room_info.get(i).text());

			detailList4.add(obj);

		}
		System.out.println(" detailList4 : " + detailList4);

		return detailList4;

	}// for

	@Override
	public JSONArray roomDetailDAO5(String bno) {

		log.info("크롤링 상세정보 처리불러오기");

		String url = bno;

		Document doc = null;

		try {
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements room_infoa = doc.select(".default_info > ul:nth-child(11)");// 9.호텔(상세 내용)

		JSONArray detailList5 = new JSONArray();

		for (int i = 0; i < room_infoa.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("room_infoa", room_infoa.get(i).text());
			detailList5.add(obj);
		}
		System.out.println(" detailList5 : " + detailList5);

		return detailList5;

	}// for

}
