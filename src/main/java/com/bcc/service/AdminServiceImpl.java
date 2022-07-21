package com.bcc.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.KakaoVO;
import com.bcc.domain.MemberVO;
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
			
		// 현재날짜로부터 7일간의 프리미엄 회원수
			for(int i=6;i>-1;i--) {
				Date date = new Date();
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				
				cal.add(Calendar.DAY_OF_MONTH, -i);
				
				int day = cal.get(Calendar.DAY_OF_MONTH);
				int month = cal.get(Calendar.MONTH)+1;
				int year = cal.get(Calendar.YEAR);
				
				log.info(year+"");
				log.info(month+"");
				log.info(day+"");
				
				JSONObject months = new JSONObject();
				months.put("v", month+"/"+day);
				
				JSONObject money = new JSONObject();
				money.put("v", dao.getTrendChart(year+" "+month+" "+day)*6000);	//금액
				
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
		
		
		// 현재 달부터 5개월 간의 프리미엄 회원수
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

	@Override
	public JSONObject getDailyMember() {
		
		//0. 최종적으로 리턴할 json 객체
		JSONObject data = new JSONObject();
		
		//1. cols 배열에 넣기
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
		//2. rows 배열에 넣기
		JSONArray body = new JSONArray();	//rows
		
		for(int i=4;i>-1;i--) {
			Date date = new Date();
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			
			cal.add(Calendar.DAY_OF_MONTH, -i);
			
			int day = cal.get(Calendar.DAY_OF_MONTH);
			int month = cal.get(Calendar.MONTH)+1;
			int year = cal.get(Calendar.YEAR);
			
			JSONObject months = new JSONObject();
			months.put("v", month+"월 "+day+"일");
			
			JSONObject web = new JSONObject();
			web.put("v", dao.getWebMem(year+" "+month+" "+day)); // 웹 가입자
			
			JSONObject sns = new JSONObject();
			sns.put("v", dao.getSNSMem(year+" "+month+" "+day)); // sns(kakao) 가입자
			
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

		return dao.totalMem();
	}

	@Override
	public Integer getTotalPmMem() {
		return dao.totalPmMem();
	}

	@Override
	public Integer getTotalComment() {
		return dao.totalComment();
	}

	@Override
	public List<Integer> getTotalAcc() {
		
		List<Integer> results = new ArrayList<Integer>();
		
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy M");
		
		// 이번달건수
		results.add(dao.totalAcc(sdf.format(date)));
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		cal.add(Calendar.MONTH, -1);
		
		int month = cal.get(Calendar.MONTH)+1;
		int year = cal.get(Calendar.YEAR);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		// 지난달건수
		results.add(dao.totalAcc(year+" "+month));
		
		
		return results;
	}
	//웹 회원 목록
	@Override
	public List<MemberVO> getallWebMember() {
		return dao.getallWebMember();
	}

	//카카오 회원 목록
	@Override
	public List<KakaoVO> getallSnsMember() {
		return dao.getallSnsMember();
	}
	//회원 삭제
	@Override
	public void deleteMember(MemberVO vo) {
		dao.deleteMember(vo);
	}
	
	
	
	
	
}
