package com.bcc.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.BoardVO;
import com.bcc.domain.KakaoVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.PreOrderVO;
import com.bcc.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	private static final int price = 6000;
	

	@Inject
	private AdminDAO dao;

	@Override
	public List<PreOrderVO> getPmInfo(String date) {

		return dao.getPmInfo(date);
	}

	@Override
	public List<PreOrderVO> getOnlyPeriod(String date) {

		return dao.getOnlyPeriod(date);
	}

	@Override
	public JSONObject getTrendChart() {

		// 0. 최종적으로 리턴할 json 객체
		JSONObject data = new JSONObject();
		// 1. cols 배열에 넣기
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();

		JSONArray title = new JSONArray();

		col1.put("label", "일자");
		col1.put("type", "string");
		col2.put("label", "매출");
		col2.put("type", "number");

		title.add(col1);
		title.add(col2);

		data.put("cols", title);

		// 2. rows 배열에 넣기
		JSONArray body = new JSONArray(); // rows

		// 현재날짜로부터 7일간의 프리미엄 회원수
		for (int i = 6; i > -1; i--) {
			Date date = new Date();

			Calendar cal = Calendar.getInstance();
			cal.setTime(date);

			cal.add(Calendar.DAY_OF_MONTH, -i);

			int day = cal.get(Calendar.DAY_OF_MONTH);
			int month = cal.get(Calendar.MONTH) + 1;
			int year = cal.get(Calendar.YEAR);

			JSONObject months = new JSONObject();
			months.put("v", month + "/" + day);

			JSONObject money = new JSONObject();
			money.put("v", dao.getTrendChart(year + " " + month + " " + day) * price); // 금액

			JSONArray row = new JSONArray();
			row.add(months);
			row.add(money);

			JSONObject cell = new JSONObject();
			cell.put("c", row);

			body.add(cell); // 레코드 1행 추가
		}

		data.put("rows", body);

		return data;
	}

	@Override
	public JSONObject getMonthlyChart() {

		// 0. 최종적으로 리턴할 json 객체
		JSONObject data = new JSONObject();
		// 1. cols 배열에 넣기
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();

		JSONArray title = new JSONArray();

		col1.put("label", "월(month)");
		col1.put("type", "string");
		col2.put("label", "매출");
		col2.put("type", "number");

		title.add(col1);
		title.add(col2);

		data.put("cols", title);

		// 현재 달부터 5개월 간의 프리미엄 회원수
		// 2. rows 배열에 넣기
		JSONArray body = new JSONArray(); // rows

		for (int i = 4; i > -1; i--) {

			Date date = new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);

			cal.add(Calendar.MONTH, -i);

			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;

			JSONObject months = new JSONObject();
			months.put("v", year + "." + month);

			JSONObject money = new JSONObject();
			money.put("v", dao.getMonthlyChart(year + " " + month) * price); // 금액

			JSONArray row = new JSONArray();
			row.add(months);
			row.add(money);

			JSONObject cell = new JSONObject();
			cell.put("c", row);

			body.add(cell); // 레코드 1행 추가
		}

		data.put("rows", body);

		return data;
	}

	@Override
	public JSONObject getDailyMember() {

		// 0. 최종적으로 리턴할 json 객체
		JSONObject data = new JSONObject();

		// 1. cols 배열에 넣기
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();

		JSONArray title = new JSONArray();

		col1.put("label", "일자");
		col1.put("type", "string");
		col2.put("label", "웹");
		col2.put("type", "number");
		col3.put("label", "sns");
		col3.put("type", "number");

		title.add(col1);
		title.add(col2);
		title.add(col3);

		data.put("cols", title);

		// 최근 5일간의 회원수 추이
		// 2. rows 배열에 넣기
		JSONArray body = new JSONArray(); // rows

		for (int i = 4; i > -1; i--) {
			Date date = new Date();

			Calendar cal = Calendar.getInstance();
			cal.setTime(date);

			cal.add(Calendar.DAY_OF_MONTH, -i);

			int day = cal.get(Calendar.DAY_OF_MONTH);
			int month = cal.get(Calendar.MONTH) + 1;
			int year = cal.get(Calendar.YEAR);

			JSONObject months = new JSONObject();
			months.put("v", month + "월 " + day + "일");

			JSONObject web = new JSONObject();
			web.put("v", dao.getWebMem(year + " " + month + " " + day)); // 웹 가입자

			JSONObject sns = new JSONObject();
			sns.put("v", dao.getSNSMem(year + " " + month + " " + day)); // sns(kakao) 가입자

			JSONArray row = new JSONArray();
			row.add(months);
			row.add(web);
			row.add(sns);

			JSONObject cell = new JSONObject();
			cell.put("c", row);

			body.add(cell); // 레코드 1행 추가
		}

		data.put("rows", body);

		return data;
	}

	@Override
	public Integer getTotalMem() {

		return dao.getTotalMem();
	}

	@Override
	public Integer getTotalPmMem() {
		return dao.getTotalPmMem();
	}

	@Override
	public Integer getTotalComment() {
		return dao.getTotalComment();
	}

	@Override
	public List<Integer> getTotalAcc() {

		List<Integer> results = new ArrayList<Integer>();

		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy M");

		// 이번달건수
		results.add(dao.getTotalAcc(sdf.format(date)));
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);

		cal.add(Calendar.MONTH, -1);

		int month = cal.get(Calendar.MONTH) + 1;
		int year = cal.get(Calendar.YEAR);
		int day = cal.get(Calendar.DAY_OF_MONTH);

		// 지난달건수
		results.add(dao.getTotalAcc(year+" "+month));
		return results;
	}

	// 웹 회원 목록
	@Override
	public List<MemberVO> getAllWebMem() {
		return dao.getAllWebMem();
	}

	// 회원 삭제
	@Override
	public void delMem(MemberVO vo) {
		dao.delMem(vo);
	}
	
	// 관광지 주소 찾기
	@Override
	public List searchAddr(String title) throws Exception {
		String clientId = "UedGUQNgMnXQN3xAYkO2"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "PKJuuL8BVC"; // 애플리케이션 클라이언트 시크릿값"

		String text = title;
		text = URLEncoder.encode(text, "UTF-8");

		String apiURL = "https://openapi.naver.com/v1/search/local?query=" + text + "&display=5";
		// String apiURL = "<https://openapi.naver.com/v1/search/blog.xml?query=>"+

		// text; // xml 결과
		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);

		JSONObject jsonObj = new JSONObject();
		JSONParser parser = new JSONParser();

		// log.info(get(apiURL,requestHeaders));

		jsonObj = (JSONObject) parser.parse(get(apiURL, requestHeaders));
		
		List list = new ArrayList();
		list.add(jsonObj.get("items"));
		list.add(jsonObj.get("total"));
		return list;
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
	
	@Override
	public int putBoard(BoardVO vo) {
		
		 return dao.putBoard(vo);
	}
	

}
