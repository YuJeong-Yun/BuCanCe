package com.bcc.domain;

public class RestaurantVO {
	
	private int num;
	private String title;
	private String content;
	private String tel;
	private String usage_day;
	private String addr;
	private String addr_full;
	private String img;
	private String thumb_img;
	private double lng;
	private double lat;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUsage_day() {
		return usage_day;
	}
	public void setUsage_day(String usage_day) {
		this.usage_day = usage_day;
	}
	public String getAddr_full() {
		return addr_full;
	}
	public void setAddr_full(String addr_full) {
		this.addr_full = addr_full;
	}
	public String getThumb_img() {
		return thumb_img;
	}
	public void setThumb_img(String thumb_img) {
		this.thumb_img = thumb_img;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	
	
	@Override
	public String toString() {
		return "RestaurantVO [num=" + num + ", title=" + title + ", content=" + content + ", tel=" + tel
				+ ", usage_day=" + usage_day + ", addr=" + addr + ", addr_full=" + addr_full + ", img=" + img
				+ ", thumb_img=" + thumb_img + ", lng=" + lng + ", lat=" + lat + "]";
	}

}
