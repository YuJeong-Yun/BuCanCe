package com.bcc.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.io.BufferedReader;
import java.io.IOException;


@Service
public class MapServiceImpl implements MapService{

	private static final Logger log = LoggerFactory.getLogger(MapServiceImpl.class);

	@Override
	public void tourLists() throws IOException{
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6260000/AttractionService/getAttractionKr"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=o5qKZe2j9oe7vmdAxcZZN0KcEuO3a1rxqX%2Bcb4UO4BNvR7DiZsBK47AMFktXFNWu9%2BaaPKhVoKGLksmQ2iVN3Q%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON������� ȣ�� �� �Ķ���� resultType=json �Է�*/
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        log.info("Response code: " + conn.getResponseCode());
        
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
        String result = sb.toString();
        log.info("result : "+result);
		
        
        // Json parser�� ����� ������� ���ڿ� �����͸� ��üȭ 
		try {
			JSONParser parser = new JSONParser(); 
			JSONObject obj;
			obj = (JSONObject) parser.parse(result);
			// response Ű�� ������ �����͸� �Ľ� 
			JSONObject parse_response = (JSONObject) obj.get("response"); 
			// response �� ���� body ã��
			JSONObject parse_body = (JSONObject) parse_response.get("body"); 
			// body �� ���� items ã�� 
			JSONObject parse_items = (JSONObject) parse_body.get("items");
			
			JSONArray parse_item = (JSONArray) parse_items.get("item");
			
		} catch (ParseException e) {
			e.printStackTrace();
		} 
        
        
	}

	@Override
	public void restaurantLists() throws IOException {
		//String url = "https://www.siksinhot.com/taste?upHpAreaId=8&hpAreaId=&isBestOrd=Y";
		

		
		String WEB_DRIVER_ID = "webdriver.chrome.driver"; //����̹� ID
		String WEB_DRIVER_PATH = "C:\\chromedriver.exe"; //����̹� ���
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		// ũ�� ������ ���� ��ü ����
		ChromeOptions options = new ChromeOptions();
		
		options.addArguments("headless");
		
		// ������ ������ �ɼ��� ���� ����̹� ��ü ����
		// WebDriver ��ü�� �� �ϳ��� ������ â�̶�� ����
		
		WebDriver driver = new ChromeDriver(options);
		String url = "https://www.siksinhot.com/taste?upHpAreaId=8&hpAreaId=&isBestOrd=Y";
		
		driver.get(url);
		
		// ������ �̵��� ����� �ε�ð� ��ٸ���
		// HTTP ����ӵ����� �ڹ��� ������ �ӵ��� �� ������ ������ ���������� 1�� ���
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		int result = 1;
		while(result == 1) {
			if(result == 1) {
				WebElement el1 = driver.findElement(By.id("tabMove1"));
				List<WebElement> el2 = el1.findElements(By.className("a"));
				
				for(int i=0;i<el2.size();i++) {
					if(el2.get(i).getText().equals("btn_sMore")) {
						el2.get(i).click();
						break;
					} else {
						result = 0;
					}
				}
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				
			} else if(result == 0) {
				Document doc = Jsoup.connect(url).get();
				   
				Elements storeElements = doc.getElementsByClass("store");
	
				 for (Element el:storeElements) 
					 log.info(el+"");
					 
			}
			
		}
		
		
		if(driver != null) {
			driver.close();
			driver.quit();
		}
		
		
	}
	
	
	
	
	
}
