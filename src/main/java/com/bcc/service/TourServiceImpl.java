package com.bcc.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bcc.domain.BoardVO;
import com.bcc.persistence.TourDAO;

@Service
public class TourServiceImpl implements TourService{
	
	@Inject
	private TourDAO dao;

	@Override
	public List<BoardVO> restaurantLists(String addr) {
		// TODO Auto-generated method stub
		return dao.restaurantLists(addr);
	}

	@Override
	public void getRestaurantInfo(List<BoardVO> restList) throws Exception {
		 String clientId = "UedGUQNgMnXQN3xAYkO2"; //���ø����̼� Ŭ���̾�Ʈ ���̵�"
		    String clientSecret = "PKJuuL8BVC"; //���ø����̼� Ŭ���̾�Ʈ ��ũ����"

		    	StringBuilder sb = null;
		    for(int i = 0;i<restList.size();i++) {
		    	sb = new StringBuilder();

		    	sb.append(restList.get(i).getAddr()+" ");

		    	// ex. �о��������(�ؿ����) -> �ؿ���� ����
		    	sb.append(restList.get(i).getTitle().split(" ")[0]);


		    String text = sb.toString();
		    text = URLEncoder.encode(text, "UTF-8");


		    String apiURL = "<https://openapi.naver.com/v1/search/blog?query=>" + text;
		    //String apiURL = "<https://openapi.naver.com/v1/search/blog.xml?query=>"+ text; // xml ���


		    Map<String, String> requestHeaders = new HashMap<String, String>();
		    requestHeaders.put("X-Naver-Client-Id", clientId);
		    requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		    String responseBody = get(apiURL,requestHeaders);
		    System.out.println(responseBody);

		    }
		
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

	@Override
	public BoardVO getInfoDetail(String title) {
		
		return dao.infoDetail(title);
	}
	
	
	
	
}
