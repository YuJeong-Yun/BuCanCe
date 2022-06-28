package com.bcc.domain;

public class roomSearch {
	
	private String area;
	private String place_name;
	private String formDate;
	private String toDate;
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
	
	
	@Override
	public String toString() {
		return "roomSearch [area=" + area + ", place_name=" + place_name + ", formDate=" + formDate + ", toDate="
				+ toDate + "]";
	}
	
	
	
	
	
}
