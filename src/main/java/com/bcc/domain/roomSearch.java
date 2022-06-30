package com.bcc.domain;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.jsoup.select.Elements;

public class roomSearch {
	
	private String area;
	private String place_name;
	private String formDate;
	private String toDate;
	private String check;
	
	//elements를 문자열로 바꾸는 형태 (숙소이름)
	public String[] transTitle(Elements room1,String room2) {
		
		List list = new ArrayList();
		list.add(room1);
		
		String t1 = list.toString();
		
		t1 = t1.replace("<strong>", "");
		t1 = t1.replace("[", "");
		t1 = t1.replace("]", "");
		t1 = t1.replace(" ", "");
		
		String[] t2 = t1.split("</strong>");
		
		return t2;
	}
	
	
	//elements를 문자열로 바꾸는 형태 (지역)
		public String[] transArea(Elements room1) {
			
			List list = new ArrayList();
			list.add(room1);
			
			String t1 = list.toString();
			
			t1 = t1.replace("<p>", "");
			t1 = t1.replace("[", "");
			t1 = t1.replace("]", "");
			t1 = t1.replace(" ", "");
			
			String[] t2 = t1.split("</p>");
			
			return t2;
		}
		
		
		
	
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getFormDate() {
		return formDate;
	}
	public void setFormDate(String formDate) {
		this.formDate = formDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}


	public String getCheck() {
		return check;
	}


	public void setCheck(String check) {
		this.check = check;
	}


	@Override
	public String toString() {
		return "roomSearch [area=" + area + ", place_name=" + place_name + ", formDate=" + formDate + ", toDate="
				+ toDate + ", check=" + check + "]";
	}
	
	
	
	
	
	
	
}
