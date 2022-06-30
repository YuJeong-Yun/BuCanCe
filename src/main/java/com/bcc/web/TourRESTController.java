package com.bcc.web;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class TourRESTController {
	

	private static final Logger log = LoggerFactory.getLogger(TourRESTController.class);
	
	
	// Naver API
	@RequestMapping(value = "/getBlog", method = RequestMethod.GET)
	public List getBlog(@RequestParam String title, String addr, String start) throws Exception{
		String clientId = "UedGUQNgMnXQN3xAYkO2"; //애플리케이션 클라이언트 아이디값"
	    String clientSecret = "PKJuuL8BVC"; //애플리케이션 클라이언트 시크릿값"


	    String text = addr+" "+title;
	    text = URLEncoder.encode(text, "UTF-8");


	    String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text + "&display=10&start="+start;
	    //String apiURL = "<https://openapi.naver.com/v1/search/blog.xml?query=>"+ text; // xml 결과


	    Map<String, String> requestHeaders = new HashMap<String, String>();
	    requestHeaders.put("X-Naver-Client-Id", clientId);
	    requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	    
	    JSONObject jsonObj = new JSONObject();
	    JSONParser parser = new JSONParser();
	    
	    jsonObj = (JSONObject) parser.parse(get(apiURL,requestHeaders));
	    
	    List list = new ArrayList();
	    list.add(jsonObj.get("items"));
		
		return list;
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
	    HttpURLConnection con = connect(apiUrl);
	    try {
	        con.setRequestMethod("GET");
	        for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
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
	// Naver API
	
	
}
