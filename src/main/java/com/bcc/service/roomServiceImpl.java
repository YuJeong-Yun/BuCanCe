package com.bcc.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.roomDate;
import com.bcc.domain.roomPayVO;
import com.bcc.domain.roomReVO;
import com.bcc.domain.roomRefundVO;
import com.bcc.domain.roomSearch;
import com.bcc.persistence.roomDAO;

@Service
public class roomServiceImpl implements roomService {

	// DAO 객체 주입
	@Inject
	private roomDAO dao;

	private static final Logger log = LoggerFactory.getLogger(roomServiceImpl.class);

	// 숙소목록 페이지
	@Override
	public JSONArray getRoomList() {

		log.info("service : 숙소목록불러오기");

		// Jsoup를 이용해서 크롤링 - 여기어때
		String url = "https://www.goodchoice.kr/product/home/12";

		Document doc = null; // Document에 페이지의 전체 소스가 저장됨

		try {
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// select를 이용하여 원하는 태그를 선택
		Elements room_title = doc.select(".list_2.adcno1 .name strong"); // 숙소명
		Elements room_pic = doc.select(".pic .lazy.align"); // 숙소그림
		Elements room_rank = doc.select(".name p.score"); // 별점
		Elements room_area = doc.select(".name > p:last-child"); // 숙소지역
		Elements room_price = doc.select(".map_html > p:nth-child(1) > b"); // 숙소대실가격
		Elements room_price2 = doc.select(".map_html > p:nth-child(2) > b"); // 숙소숙박가격
		Elements room_link = doc.select(".list_2.adcno1 > a"); // 페이지이동후 크롤링할 페이지주소

		// JSON 형태로 숙소 정보 저장
		JSONArray roomList = new JSONArray();

		for (int i = 0; i < room_title.size(); i++) {
			// JSONObject에 키:값 형태로 데이터 저장
			JSONObject obj = new JSONObject();

			obj.put("room_title", room_title.get(i).text());
			obj.put("room_pic", room_pic.get(i).attr("data-original"));
			obj.put("room_rank", room_rank.get(i).text());
			obj.put("room_area", room_area.get(i).text());
			obj.put("room_price", room_price.get(i).text().replace("원", ""));
			obj.put("room_price2", room_price2.get(i).text().replace("원", ""));
			obj.put("room_link", room_link.get(i).attr("href"));

			// roomList에 생성한 JSONObject 추가
//				log.info(obj+"");
			roomList.add(obj);
		}
		System.out.println(" roomList : " + roomList);

		return roomList;
	}

	// 숙소목록페이지에서 검색한 정보만 불러오게함
	@Override
	public JSONArray getRoomSearchList(roomSearch rs) {

		log.info("숙소를 검색한 페이지만 불러오기");

		// Jsoup를 이용해서 크롤링 - 여기어때
		String url = "https://www.goodchoice.kr/product/home/12";

		Document doc = null; // Document에 페이지의 전체 소스가 저장됨

		try {
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// select를 이용하여 원하는 태그를 선택
		Elements room_title = doc.select(".list_2.adcno1 .name strong"); // 숙소이름
		Elements room_pic = doc.select(".pic .lazy.align"); // 숙소사진
		Elements room_rank = doc.select(".name p.score"); // 평점
		Elements room_area = doc.select(".name > p:last-child"); // 숙소지역
		Elements room_price = doc.select(".map_html > p:nth-child(1) > b"); // 대실가격
		Elements room_price2 = doc.select(".map_html > p:nth-child(2) > b"); // 숙박가격
		Elements room_link = doc.select(".list_2.adcno1 > a"); // 이후에 크롤링할페이지를 저장
		// JSON 형태로 영화 정보 저장
		JSONArray roomList = new JSONArray();
//			[log.info](http://log.info/)(room_title+"");

		// 지역검색
		String[] areas = rs.getArea().split("/");
		String[] areaArr = rs.transArea(room_area);

		// 제목검색
		String[] titleArr = rs.transTitle(room_title, rs.getPlace_name());
		String title = rs.getPlace_name();
		// 제목검색
		log.info(titleArr + "");
		log.info(title + "");

		// 지역을 선택하지않은 경우
		if (rs.getArea().equals("favorite")) {

			// 입력한 숙소명을 통해 숙소명에 해당하는 정보만 크롤링
			for (int i = 0; i < room_title.size(); i++) {
				// JSONObject에 키:값 형태로 데이터 저장
				JSONObject obj = new JSONObject();

				// 검색어를 입력할때 숙소명이 있는 경우
				if (titleArr[i].contains(title)) {

					obj.put("room_title", room_title.get(i).text());
					obj.put("room_pic", room_pic.get(i).attr("data-original"));
					obj.put("room_rank", room_rank.get(i).text());
					obj.put("room_area", room_area.get(i).text());
					obj.put("room_price", room_price.get(i).text().replace("원", ""));
					obj.put("room_price2", room_price2.get(i).text().replace("원", ""));
					obj.put("room_link", room_link.get(i).attr("href"));

					roomList.add(obj);

					// 검색을하지않은 경우
				} else if (title == null) {

					obj.put("room_title", room_title.get(i).text());
					obj.put("room_pic", room_pic.get(i).attr("data-original"));
					obj.put("room_rank", room_rank.get(i).text());
					obj.put("room_area", room_area.get(i).text());
					obj.put("room_price", room_price.get(i).text().replace("원", ""));
					obj.put("room_price2", room_price2.get(i).text().replace("원", ""));
					obj.put("room_link", room_link.get(i).attr("href"));

					roomList.add(obj);

				}

			} // 여기까지

		} else {// 지역을 선택한경우

			// 검색어는 입력하지않고 지역만 선택한 경우
			if (title == null) {
				for (int j = 0; j < areas.length; j++) {

					for (int i = 0; i < room_title.size(); i++) {
						// JSONObject에 키:값 형태로 데이터 저장
						JSONObject obj = new JSONObject();

						if (areaArr[i].contains(areas[j])) {

							obj.put("room_title", room_title.get(i).text());
							obj.put("room_pic", room_pic.get(i).attr("data-original"));
							obj.put("room_rank", room_rank.get(i).text());
							obj.put("room_area", room_area.get(i).text());
							obj.put("room_price", room_price.get(i).text().replace("원", ""));
							obj.put("room_price2", room_price2.get(i).text().replace("원", ""));
							obj.put("room_link", room_link.get(i).attr("href"));

							roomList.add(obj);
						}
					}
				} // String[] t3 = rs.transArea(room_area);
			} else {// 숙소명을 선택후 검색어를 입력한 경우 숙소명과 검색어를 비교

				// 지역검색
//			String[] areas = rs.getArea().split("/"); 입력받은 지역명을 나눈것
//			String[] areaArr = rs.transArea(room_area); 크롤링받은 지역명

				for (int j = 0; j < areas.length; j++) {

					for (int i = 0; i < room_title.size(); i++) {
						// JSONObject에 키:값 형태로 데이터 저장
						JSONObject obj = new JSONObject();

						if (areaArr[i].contains(areas[j])) {

							if (titleArr[i].contains(title)) {

								obj.put("room_title", room_title.get(i).text());
								obj.put("room_pic", room_pic.get(i).attr("data-original"));
								obj.put("room_rank", room_rank.get(i).text());
								obj.put("room_area", room_area.get(i).text());
								obj.put("room_price", room_price.get(i).text().replace("원", ""));
								obj.put("room_price2", room_price2.get(i).text().replace("원", ""));
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

	// roomDetail0~5까지 방상세정보를 불러오는 동작
	@Override
	public JSONArray getRoomDetail0(String bno) {

		log.info("크롤링 처리불러오기");

		String url = bno;

		Document doc = null; // Document에 페이지의 전체 소스가 저장됨

		try {
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// select를 이용하여 원하는 태그를 선택

//		Elements room_pic = doc.select(".pic_view > img"); // 2. 대표사진
		Elements room_pic = doc.select(".gallery_pc .swiper-wrapper > li > img"); // 2. 대표사진

		// JSON 형태로 영화 정보 저장

		JSONArray detailList0 = new JSONArray();

		for (int i = 0; i < room_pic.size(); i++) {
			// JSONObject에 키:값 형태로 데이터 저장
			JSONObject obj = new JSONObject();

//			obj.put("room_pic", room_pic.get(i).attr("data-original"));
			obj.put("room_pic", room_pic.get(i).attr("data-src"));

			detailList0.add(obj);

		}
		System.out.println(" detailList : " + detailList0);

		return detailList0;
	}

	@Override
	public JSONArray getRoomDetail(String bno) {

		log.info("크롤링 처리불러오기");

		// Jsoup를 이용해서 크롤링 - 여기어때
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
//		Elements room_pic = doc.select(".pic_view .lazy"); // 2. 대표사진
		Elements room_star_num = doc.select(".score_cnt span");// 4.별점(숫자)
		Elements room_address = doc.select(".info .address"); // 5. 주소

		// JSON 형태로 영화 정보 저장

		JSONArray detailList = new JSONArray();

		for (int i = 0; i < room_title.size(); i++) {
			// JSONObject에 키:값 형태로 데이터 저장
			JSONObject obj = new JSONObject();

			obj.put("room_title", room_title.get(i).text());
//			obj.put("room_pic", room_pic.get(i).attr("data-original"));
			obj.put("room_star_num", room_star_num.get(i).text());
			obj.put("room_address", room_address.get(i).text());

			detailList.add(obj);

		}
		System.out.println(" detailList : " + detailList);

		return detailList;
	}

	@Override
	public JSONArray getRoomDetail2(String bno) {
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
	}

	@Override
	public JSONArray getRoomDetail3(String bno) {
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
	}

	@Override
	public JSONArray getRoomDetail4(String bno) {
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
	}

	@Override
	public JSONArray getRoomDetail5(String bno) {
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
	}
	// roomDetail0~5까지 방상세정보를 불러오는 동작

	// 숙소상세가격
	@Override
	public JSONArray getRoomPrice(String bno) {

		// Jsoup를 이용해서 크롤링 - 여기어때
		String url = bno;

		Document doc = null; // Document에 페이지의 전체 소스가 저장됨

		try {
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		Element roomToday // 대실정보
				= doc.selectFirst(".normal_day > table");

		Element roomTimeTo // 대실시간
				= doc.selectFirst(".normal_day > table:last-child");

		Element roomOneTo // 숙박정보
				= doc.selectFirst(".normal_day:last-child > table");

		Element roomTimeOne // 숙박시간
				= doc.selectFirst(".normal_day:last-child > table:last-child");

		JSONObject obj1 = new JSONObject();
		JSONObject obj2 = new JSONObject();
		JSONObject obj3 = new JSONObject();
		JSONObject obj4 = new JSONObject();

		obj1.put("roomToday", roomToday);
		obj2.put("roomOneTo", roomOneTo);
		obj3.put("roomTimeTo", roomTimeTo);
		obj4.put("roomTimeOne", roomTimeOne);

		JSONArray arr = new JSONArray();

		arr.add(obj1);
		arr.add(obj2);
		arr.add(obj3);
		arr.add(obj4);

		log.info(arr + "");

		return arr;
	}

	// 숙소예약
	@Override
	public JSONArray reserveRoom(String bno, roomDate rd, String ano) throws ParseException {

		log.info("크롤링 처리불러오기");
		// Jsoup를 이용해서 크롤링 - 여기어때
		String url = "https://www.goodchoice.kr/product/detail?ano=66035&adcno=1&sel_date=2022-07-01&sel_date2=2022-07-02";

		log.info(url);

		// 임의의 날짜

		// 주소의 날짜값을 바꿔주는 구문
		// 첫번째 날짜와 두번째 날짜값
		String ch_date = rd.getSel_date();
		String ch_date2 = rd.getSel_date2();
		String ch_ano = ano;

		int date_idx = url.indexOf("sel_date=");
		int date2_idx = url.indexOf("sel_date2=");
		int ano_idx = url.indexOf("ano=");

		String aa = url.substring(date_idx + 9, date_idx + 19);
		String bb = url.substring(date2_idx + 10, date2_idx + 20);
		String cc = url.substring(ano_idx + 4, url.indexOf("&"));

		url = url.replace(aa, rd.getSel_date());
		url = url.replace(bb, rd.getSel_date2());
		url = url.replace(cc, ch_ano);
		// 주소의 날짜값을 바꿔주는 구문

		log.info(url);

		// 컴퓨터시각 오늘
		Calendar cal = Calendar.getInstance();
		String format = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String today = sdf.format(cal.getTime());
		// 컴퓨터시각 오늘

		// 컴퓨터시각 내일
		Calendar cal2 = Calendar.getInstance();
		String format2 = "yyyy-MM-dd";
		SimpleDateFormat sdf2 = new SimpleDateFormat(format2);
		cal2.add(cal2.DATE, +1); // 날짜를 하루 더한다.
		String tomorrow = sdf.format(cal2.getTime());
		// 컴퓨터시각 내일

		// 선택한 날짜값 차이를 구하는 구문
		SimpleDateFormat transformat = new SimpleDateFormat("yyyy-MM-dd");
		Date firstDate = (Date) transformat.parse(ch_date);
		Date secondDate = (Date) transformat.parse(ch_date2);

		long diff = secondDate.getTime() - firstDate.getTime();
		TimeUnit time = TimeUnit.DAYS;
		long diffrence = time.convert(diff, TimeUnit.MILLISECONDS);
		System.out.println("받은날짜값 차이 : " + diffrence);
		// 선택한 날짜값 차이를 구하는 구문

		log.info("오늘날짜 : " + today);
		log.info("내일날짜 : " + tomorrow);
		log.info("체크인날짜 : " + rd.getSel_date());
		log.info("체크아웃날짜 : " + rd.getSel_date2());

		Document doc = null; // Document에 페이지의 전체 소스가 저장됨

		try {
			doc = Jsoup.connect(url).get();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// select를 이용하여 원하는 태그를 선택
		Elements room_pic = doc.select(".pic_view > img");
		Elements room_title = doc.select(".title");
		Elements room_fcost = doc.select(".info .price:nth-child(1) > div > p:last-child");
		Elements room_reserve = doc.select(".info > div > button");
		Elements room_endtime = doc.select(".info .half:first-child .price > ul > li:first-child");
		Elements room_usetime = doc.select(".info .half:first-child .price > ul > li:last-child");
		Elements room_accendtime = doc.select(".info .half:last-child .price > ul > li:first-child");
		Elements room_accusetime = doc.select(".info .half:last-child .price > ul > li:last-child");

		Elements room_accendtimes = doc.select(".info .fast .price > ul > li:first-child");
		Elements room_accusetimes = doc.select(".info .fast .price > ul > li:last-child");

		Elements room_tf = doc.select(".info > div:first-child > button");
		Elements room_df = doc.select(".info > div:last-child > button");

		JSONArray roomList = new JSONArray();

		for (int i = 0; i < room_pic.size(); i++) {
			// JSONObject에 키:값 형태로 데이터 저장
			JSONObject obj = new JSONObject();

			obj.put("room_pic", room_pic.get(i).attr("data-original"));
			obj.put("room_title", room_title.get(i).text());

			// 표준시간내일과 입력받은 내일날짜가 같지않을때
			if (!rd.getSel_date2().equals(tomorrow)) {

				// 입력받은 날짜차이가 하루일때
				if (diffrence == 1) {

					obj.put("room_fcost", room_fcost.get(i * 2).text().replaceAll("[^0-9]", ""));
					obj.put("room_lcost", room_fcost.get((i * 2) + 1).text().replaceAll("[^0-9]", "") + "1");
					obj.put("room_reserve1", room_reserve.get((i * 2)).text());
					obj.put("room_reserve2", room_fcost.get((i * 2) + 1).text().replaceAll("[^0-9]", "") + "1");
					obj.put("room_endtime", room_endtime.get(i).text().replaceAll("[^0-9]", ""));
					obj.put("room_usetime", room_usetime.get(i).text().replaceAll("[^0-9]", ""));
					obj.put("room_accendtime", room_accendtime.get(i).text().replaceAll("[^0-9]", ""));
					obj.put("room_accusetime", room_accusetime.get(i).text().replaceAll("[^0-9]", ""));
					obj.put("room_tf", room_tf.get(i).text());
					obj.put("room_df", room_df.get(i).text());

				} // 아닐때
				else {
					obj.put("room_fcost", "");
					obj.put("room_lcost", room_fcost.get((i)).text().replaceAll("[^0-9]", "").substring(0,
							room_fcost.get((i)).text().replaceAll("[^0-9]", "").length() - 1));
					obj.put("room_reserve1", "");
					obj.put("room_reserve2", room_reserve.get((i)).text().replaceAll("[^0-9]", ""));
					obj.put("room_endtime", "");
					obj.put("room_usetime", "");
					obj.put("room_accendtime", room_accendtimes.get(i).text().replaceAll("[^0-9]", ""));
					obj.put("room_accusetime", room_accusetimes.get(i).text().replaceAll("[^0-9]", "").substring(2));
				}

				// 입력받은 내일날짜와 표준날짜가 내일일때
			} else if (tomorrow.equals(rd.getSel_date2())) {
				obj.put("room_fcost", room_fcost.get(i * 2).text().replaceAll("[^0-9]", ""));
				obj.put("room_lcost", room_fcost.get((i * 2) + 1).text().replaceAll("[^0-9]", "") + "1");
				obj.put("room_reserve1", room_reserve.get((i * 2)).text());
				obj.put("room_reserve2", room_fcost.get((i * 2) + 1).text().replaceAll("[^0-9]", "") + "1");
				obj.put("room_endtime", room_endtime.get(i).text().replaceAll("[^0-9]", ""));
				obj.put("room_usetime", room_usetime.get(i).text().replaceAll("[^0-9]", ""));
				obj.put("room_accendtime", room_accendtime.get(i).text().replaceAll("[^0-9]", ""));
				obj.put("room_accusetime", room_accusetime.get(i).text().replaceAll("[^0-9]", ""));
				obj.put("room_tf", room_tf.get(i).text());
				obj.put("room_df", room_df.get(i).text());

			}

			// roomList에 생성한 JSONObject 추가
//				log.info(obj+"");
			roomList.add(obj);
		}
		System.out.println(" roomList : " + roomList);

		return roomList;
	}

	// 결제 성공시 db에 입력
	@Override
	public void insertRoomPay(roomPayVO vo) {

		dao.putPaymentRoom(vo);

	}

	// 결제 후 내역페이지
	@Override
	public roomPayVO getRoomPayInfo(String accId) {

		return dao.getReInfo(accId);
	}

	// 유저예약정보
	@Override
	public List<roomPayVO> getRoomUserPayInfo(String userId) {
		return dao.getRoomReInfo(userId);
	}

	// 최대 주문번호에 1을 더해준다
	@Override
	public String SearchPayId() {
		String a = dao.getMaxReRoom();

		log.info("a = " + a);

		// a 문자부분
		String b = "bccReNum";
		int c = 0;

		// 데이터 값이 없을때는 bcc1이 들어가고 있을때는 bcc2,bcc3....로 들어감
		if (a == null) {
			b = "bccReNum";
			c = 0;
		} else {
			// a의 숫자부분
			c = Integer.parseInt(a.replaceAll("[^0-9]", ""));

		}

		String d = b + (c + 1);

		log.info(d);

		return d;
	}

	// 환불시 결제 상태 변경
	@Override
	public void modPayStatus(String accId) {

		dao.modReStatus(accId);
	}

	// 환불테이블 고유아이디값
	@Override
	public String refundRoom() {
		String a = dao.getMaxRefund();

		// a 문자부분
		String b = "bccRfNum";

		// a 숫자부분
		int c = 0;

		if (a == null) {

			b = "bccRfNum";
			c = 0;
		} else {
			c = Integer.parseInt(a.replaceAll("[^0-9]", ""));

		}

		String d = b + (c + 1);

		return d;
	}

	// 환불시 환불테이블에 데이터입력
	@Override
	public void putRoomRefund(roomRefundVO vo2) {

		dao.putRfRoom(vo2);

	}

	@Override
	public String payRefund(roomPayVO vo) throws IOException, org.json.simple.parser.ParseException {
		// access_token 발급
		HttpURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");
		conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JSONObject obj = new JSONObject();
		obj.put("imp_key", "3817682477122484");
		obj.put("imp_secret", "a060f160cc159fd09923a2ebfb7678adbac710c0105bedad238924b8d34a67409508e32f09830702");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(obj.toString());
		bw.flush();
		bw.close();
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		StringBuilder sb = new StringBuilder();
		String line = null;
		while ((line = br.readLine()) != null) {
			sb.append(line + "\n");
		}
		br.close();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParser.parse(sb.toString());
		JSONObject responseData = (JSONObject) jsonObj.get("response");
		String access_token = (String) responseData.get("access_token");

		log.info("액세스토큰 :" + access_token);

		// REST API(결제환불) 호출
		HttpURLConnection conn2 = null;
		URL url2 = new URL("https://api.iamport.kr/payments/cancel");
		conn2 = (HttpURLConnection) url2.openConnection();
		conn2.setRequestMethod("POST");
		conn2.setRequestProperty("Content-Type", "application/json");
		conn2.setRequestProperty("Authorization", access_token);
		conn2.setDoOutput(true);
		JSONObject obj2 = new JSONObject();
		obj2.put("reason", "숙소 환불");
		obj2.put("merchant_uid", vo.getAccId());
		obj2.put("amount", vo.getAccAmount());
		BufferedWriter bw2 = new BufferedWriter(new OutputStreamWriter(conn2.getOutputStream()));
		bw2.write(obj2.toString());
		bw2.flush();
		bw2.close();
		BufferedReader br2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
		StringBuilder sb2 = new StringBuilder();
		String line2 = null;
		while ((line2 = br2.readLine()) != null) {
			sb2.append(line2 + "\n");
		}
		br2.close();

		return "OK";

	}

}