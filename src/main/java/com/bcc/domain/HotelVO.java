package com.bcc.domain;

public class HotelVO {
	private int num;
	private double lng;
	private double lat;
	private String img;
	private String title;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "HotelVO [num=" + num + ", lng=" + lng + ", lat=" + lat + ", img=" + img + ", title=" + title + "]";
	}

}
