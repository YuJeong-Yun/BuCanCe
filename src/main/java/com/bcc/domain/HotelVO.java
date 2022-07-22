package com.bcc.domain;

public class HotelVO {
	private int num;
	private double lng;
	private double lat;
	private String thumbnail;
	private String title;
	private int t_category;

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

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getT_category() {
		return t_category;
	}

	public void setT_category(int t_category) {
		this.t_category = t_category;
	}

	@Override
	public String toString() {
		return "HotelVO [num=" + num + ", lng=" + lng + ", lat=" + lat + ", thumbnail=" + thumbnail + ", title=" + title
				+ ", t_category=" + t_category + "]";
	}

}