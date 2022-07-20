package com.bcc.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.PreOrderVO;
import com.bcc.persistence.AdminDAO;


@Service
public class AdminServiceImpl implements AdminService{
	

	private static final Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);

	@Inject
	private AdminDAO dao;

	@Override
	public List<PreOrderVO> getPmInfo(String date) {
		
		return dao.getPmInfo(date);
	}

	@Override
	public List<String> getPm(String date) {
		
		return dao.getPm(date);
	}

	@Override
	public List<PreOrderVO> getOnlyPeriod(String date) {
		
		return dao.getOnlyPeriod(date);
	}

	@Override
	public JSONObject getTrendChart() {
		
		//0. 최종적으로 리턴할 json 객체
		JSONObject data = new JSONObject();
		//1. cols 배열에 넣기
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
		
		
		//2. rows 배열에 넣기
		JSONArray body = new JSONArray();	//rows
		
			
			
			for(int i=6;i>-1;i--) {
				Date date = new Date();
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				
				cal.add(Calendar.DAY_OF_MONTH, -i);
				
				int day = cal.get(Calendar.DAY_OF_MONTH);
				int month = cal.get(Calendar.MONTH)+1;
				
				JSONObject months = new JSONObject();
				months.put("v", month+"월 "+day+"일");
				
				JSONObject money = new JSONObject();
				money.put("v", dao.getTrendChart(day+" "+month)*6000);	//금액
				
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
		
		//0. 최종적으로 리턴할 json 객체
		JSONObject data = new JSONObject();
		//1. cols 배열에 넣기
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
		
		
		//2. rows 배열에 넣기
		JSONArray body = new JSONArray();	//rows
			
			for(int i=4;i>-1;i--) {
				
				Date date = new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				
				cal.add(Calendar.MONTH, -i);
				
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH)+1;
				
				JSONObject months = new JSONObject();
				months.put("v", year+"."+month);
				
				JSONObject money = new JSONObject();
				money.put("v", dao.getMonthlyChart(year+" "+month)*6000);	//금액
				
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
	
	
	
	
	
}
