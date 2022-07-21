package com.bcc.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.bcc.domain.SearchCriteria;
import com.bcc.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	

	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Inject
	private BoardDAO dao;


		//글 번호에 해당 되는 페이지 상세보기
		@Override
		public BoardVO getTour(int num) throws Exception {
			BoardVO vo = dao.getTour(num);
			return vo;
		}	
		
		// 조회수
		@Override
		public void updateBoardCount(Integer num) throws Exception {
			dao.updateBoardCnt(num);
		}
		
		//게시물 목록 조회
		@Override
		public List<BoardVO> list(SearchCriteria scri) throws Exception {
			return dao.list(scri);
		}
		
		// 게시물 정렬 목록 조회
		@Override
		public List<BoardVO> listAlign(SearchCriteria scri) throws Exception {
			
			if(scri.getAddr().equals("all"))
				return dao.listAlign(scri);
			else
				return dao.addrListAlign(scri);
			
		}
		
		
		// 블로그 조회 목록
		@Override
		public List getBlog(String title, String addr, String start) throws Exception {
			
			String clientId = "UedGUQNgMnXQN3xAYkO2"; // 애플리케이션 클라이언트 아이디값"
			String clientSecret = "PKJuuL8BVC"; // 애플리케이션 클라이언트 시크릿값"
			
			String text = addr + " " + title;
			text = URLEncoder.encode(text, "UTF-8");
			
			String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text + "&start=" + start;
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
		private static HttpURLConnection connect(String apiUrl){
		    try {
		        URL url = new URL(apiUrl);
		        return (HttpURLConnection)url.openConnection();
		    } catch (MalformedURLException e) {
		        throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		    } catch (IOException e) {
		        throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		    }
		}
		private static String readBody(InputStream body){
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
		
	
	
		
		// 실시간 날씨
		@Override
		public JSONArray getWeather() throws Exception {
		// 날짜관련 변수
		Calendar todayCal = Calendar.getInstance(); // 오늘 날짜
		Calendar yesCal = Calendar.getInstance(); // 어제 날짜
		String format = "yyyyMMdd"; //20220308 형식으로 받아오기
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		yesCal.add(yesCal.DATE, -1); //날짜를 하루 뺀다.
		String yesDate = sdf.format(yesCal.getTime()); // 어제 날짜
		String toDate = sdf.format(todayCal.getTime()); // 오늘 날짜
		String baseDate = toDate;
		
		String type = "json";	//조회하고 싶은 type(json, xml 중 고름)
		
		// 시간계산
		int[] hours_li = {2,5,8,11,14,17,20,23};
 	
		// 시간관련 변수
		int hour = 0;	//계산결과변수
		String baseTime = ""; //조회하고 싶은 시간
		LocalTime tnow = LocalTime.now();
 		int hourValue = tnow.getHour();
 		
		 	for(int i=0;i<hours_li.length;i++){
		 		int h = hours_li[i]-hourValue;
		 		if(h==-2 || h==-1 || h==0){
		 			hour = hours_li[i];
		 		} else if(hourValue==0 || hourValue==1){// 00시나 01시일 경우 전날 23시로 시간 조회
		 			hour = hours_li[7];
		 			baseDate = yesDate;
		 		}
		 	}
	 	
		 	if(hour<10){ // 10시 이전 표기 ex.0900,0700
				baseTime = "0"+hour+"00";
			} else { 
				baseTime = hour+"00";
			}
		 	
			 // 참고문서에 있는 url주소
		     String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
		     // 홈페이지에서 받은 키
		     String serviceKey = "o5qKZe2j9oe7vmdAxcZZN0KcEuO3a1rxqX%2Bcb4UO4BNvR7DiZsBK47AMFktXFNWu9%2BaaPKhVoKGLksmQ2iVN3Q%3D%3D";
		     StringBuilder urlBuilder = new StringBuilder(apiUrl);
		     
		     urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey);
		     urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* 조회하고싶은 날짜*/
		     urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* 조회하고싶은 시간 AM 02시부터 3시간 단위 */
		     urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));	/* 타입 */
		     urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("98", "UTF-8")); //경도
		     urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("76", "UTF-8")); //위도
		     // log.info("baseDate : "+baseDate);
		     // log.info("baseTime : "+baseTime);
		     
		     URL url = new URL(urlBuilder.toString());
		     // log.info("url: "+url);
		     HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		     conn.setRequestMethod("GET");
		     conn.setRequestProperty("Content-type", "application/json");
		     //System.out.println(conn.getResponseCode());
		     
		     BufferedReader rd;
		     if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		         rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		     } else {
		         rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		     }
		     
		     StringBuilder sb = new StringBuilder();
		     String line;
		     while ((line = rd.readLine()) != null) {
		         sb.append(line);
		     }
		     rd.close();
		     conn.disconnect();
		     String result= sb.toString();
		     // log.info(result);
			 	
		     
		 	//=======이 밑에 부터는 json에서 데이터 파싱해 오는 부분이다=====//
		     // Json parser를 만들어 만들어진 문자열 데이터를 객체화 
     		JSONParser parser = new JSONParser(); 
     		JSONObject obj = (JSONObject) parser.parse(result); 
     		// response 키를 가지고 데이터를 파싱 
     		JSONObject parse_response = (JSONObject) obj.get("response"); 
     		// response 로 부터 body 찾기
     		JSONObject parse_body = (JSONObject) parse_response.get("body"); 
     		// body 로 부터 items 찾기 
     		JSONObject parse_items = (JSONObject) parse_body.get("items");
     		// items로 부터 itemlist 를 받기 
     		JSONArray parse_item = (JSONArray) parse_items.get("item");
     		//log.info(parse_item+"");
			
			return parse_item;
		}

	
	//게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		if(scri.getAddr().equals("all"))
			return dao.listCount(scri);
		else
			return dao.listCountAddr(scri);
		
	}
		
	
	
	/////////////////찜기능//////////////////////
	@Override
	public Integer checkThumb(int b_num, String id) {
		
		return dao.checkThumb(b_num,id);
	}

	@Override
	public void updateThumb(int b_num, int b_category, String id) {
		int result = dao.checkThumb(b_num, id);
		
		if(result == 1) {
			// 좋아요 기록 있을 시 카운트-1, 테이블에서 기록 삭제
			dao.subThumb(b_num);
			dao.deleteThumb(b_num, id);
		} else if (result == 0) {
			// 좋아요 기록 없을 시 카운트+1, 테이블에 삽입
			dao.addThumb(b_num);
			dao.insertThumb(b_num, b_category, id);
		}
		
	}
	/////////////////찜기능//////////////////////


	@Override
	public List<BoardVO> searchList(String keyword) {
		
		return dao.searchList(keyword);
	}

	@Override
	public int listCountAddr(SearchCriteria scri) throws Exception {
		
		return dao.listCountAddr(scri);
	}

	@Override
	public List<BoardVO> listAddr(SearchCriteria scri) throws Exception {
		
		return dao.listAddr(scri);
	}
	
	
	

}
