package com.bcc.web;

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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping("/tour/*")
public class TourRESTController {
	

	private static final Logger log = LoggerFactory.getLogger(TourRESTController.class);
	
	
	// Naver API
	
	// ��α� �˻�
	@RequestMapping(value = "/getBlog", method = RequestMethod.GET)
	public List getBlog(@RequestParam String title, String addr, String start) throws Exception{
		String clientId = "UedGUQNgMnXQN3xAYkO2"; //���ø����̼� Ŭ���̾�Ʈ ���̵�"
	    String clientSecret = "PKJuuL8BVC"; //���ø����̼� Ŭ���̾�Ʈ ��ũ����"


	    String text = addr+" "+title;
	    text = URLEncoder.encode(text, "UTF-8");


	    String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text + "&start="+start;
	    //String apiURL = "<https://openapi.naver.com/v1/search/blog.xml?query=>"+ text; // xml ���


	    Map<String, String> requestHeaders = new HashMap<String, String>();
	    requestHeaders.put("X-Naver-Client-Id", clientId);
	    requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	    
	    JSONObject jsonObj = new JSONObject();
	    JSONParser parser = new JSONParser();
	    
	    //log.info(get(apiURL,requestHeaders));
	    
	    jsonObj = (JSONObject) parser.parse(get(apiURL,requestHeaders));
	    
	    List list = new ArrayList();
	    list.add(jsonObj.get("items"));
	    list.add(jsonObj.get("total"));
		
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
	        if (responseCode == HttpURLConnection.HTTP_OK) { // ���� ȣ��
	            return readBody(con.getInputStream());
	        } else { // ���� �߻�
	            return readBody(con.getErrorStream());
	        }
	    } catch (IOException e) {
	        throw new RuntimeException("API ��û�� ���� ����", e);
	    } finally {
	        con.disconnect();
	    }
	}


	private static HttpURLConnection connect(String apiUrl){
	    try {
	        URL url = new URL(apiUrl);
	        return (HttpURLConnection)url.openConnection();
	    } catch (MalformedURLException e) {
	        throw new RuntimeException("API URL�� �߸��Ǿ����ϴ�. : " + apiUrl, e);
	    } catch (IOException e) {
	        throw new RuntimeException("������ �����߽��ϴ�. : " + apiUrl, e);
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
	        throw new RuntimeException("API ������ �дµ� �����߽��ϴ�.", e);
	    }

	}
	// Naver API 
	
	
	@RequestMapping(value = "getWeather", method = RequestMethod.GET)
	public JSONArray getWeatherdata() throws Exception {
		
		// ��¥���� ����
		Calendar todayCal = Calendar.getInstance(); // ���� ��¥
		Calendar yesCal = Calendar.getInstance(); // ���� ��¥
		String format = "yyyyMMdd"; //20220308 �������� �޾ƿ���
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		yesCal.add(yesCal.DATE, -1); //��¥�� �Ϸ� ����.
		String yesDate = sdf.format(yesCal.getTime()); // ���� ��¥
		String toDate = sdf.format(todayCal.getTime()); // ���� ��¥
		String baseDate = toDate;
		
		String type = "json";	//��ȸ�ϰ� ���� type(json, xml �� ��)
		
		// �ð����
		int[] hours_li = {2,5,8,11,14,17,20,23};
 	
		// �ð����� ����
		int hour = 0;	//���������
		String baseTime = ""; //��ȸ�ϰ� ���� �ð�
		LocalTime tnow = LocalTime.now();
 		int hourValue = tnow.getHour();
 		
		 	for(int i=0;i<hours_li.length;i++){
		 		int h = hours_li[i]-hourValue;
		 		if(h==-2 || h==-1 || h==0){
		 			hour = hours_li[i];
		 		} else if(hourValue==0 || hourValue==1){// 00�ó� 01���� ��� ���� 23�÷� �ð� ��ȸ
		 			hour = hours_li[7];
		 			baseDate = yesDate;
		 		}
		 	}
	 	
		 	if(hour<10){ // 10�� ���� ǥ�� ex.0900,0700
				baseTime = "0"+hour+"00";
			} else { 
				baseTime = hour+"00";
			}
		 	
//			�������� �ִ� url�ּ�
		     String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
//		      Ȩ���������� ���� Ű
		     String serviceKey = "o5qKZe2j9oe7vmdAxcZZN0KcEuO3a1rxqX%2Bcb4UO4BNvR7DiZsBK47AMFktXFNWu9%2BaaPKhVoKGLksmQ2iVN3Q%3D%3D";

		     StringBuilder urlBuilder = new StringBuilder(apiUrl);
		     
		     urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+serviceKey);
		     urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /* ��ȸ�ϰ���� ��¥*/
		     urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /* ��ȸ�ϰ���� �ð� AM 02�ú��� 3�ð� ���� */
		     urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode(type, "UTF-8"));	/* Ÿ�� */
		     urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("98", "UTF-8")); //�浵
		     urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("76", "UTF-8")); //����
//		     log.info("baseDate : "+baseDate);
//		     log.info("baseTime : "+baseTime);
		     
		     URL url = new URL(urlBuilder.toString());
//		     log.info("url: "+url);

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
//		     log.info(result);
			 	
		     
		 	//=======�� �ؿ� ���ʹ� json���� ������ �Ľ��� ���� �κ��̴�=====//
		     // Json parser�� ����� ������� ���ڿ� �����͸� ��üȭ 
     		JSONParser parser = new JSONParser(); 
     		JSONObject obj = (JSONObject) parser.parse(result); 
     		// response Ű�� ������ �����͸� �Ľ� 
     		JSONObject parse_response = (JSONObject) obj.get("response"); 
     		// response �� ���� body ã��
     		JSONObject parse_body = (JSONObject) parse_response.get("body"); 
     		// body �� ���� items ã�� 
     		JSONObject parse_items = (JSONObject) parse_body.get("items");

     		// items�� ���� itemlist �� �ޱ� 
     		JSONArray parse_item = (JSONArray) parse_items.get("item");
     		//log.info(parse_item+"");
		
     		
     		return parse_item;
	}
	
	
	
	
}
