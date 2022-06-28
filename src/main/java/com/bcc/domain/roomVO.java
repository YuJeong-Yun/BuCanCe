package com.bcc.domain;

public class roomVO {

	private String bks_room_id; //방고유아이디
	private String bks_room_kind; //방종류
	private String bks_room_area; //해당지역
	private String bks_room_info; //방정보
	private String bks_room_state; //방상태
	private int bks_room_people; //방인원수
	private int bks_room_price; //방가격
	private int bks_room_sale_price; //방세일가격
	private String bks_checkin; //체크인
	private String bks_checkout; //체크아웃
	
	
	public String getBks_room_area() {
		return bks_room_area;
	}
	public void setBks_room_area(String bks_room_area) {
		this.bks_room_area = bks_room_area;
	}
	public String getBks_room_state() {
		return bks_room_state;
	}
	public void setBks_room_state(String bks_room_state) {
		this.bks_room_state = bks_room_state;
	}
	public int getBks_room_people() {
		return bks_room_people;
	}
	public void setBks_room_people(int bks_room_people) {
		this.bks_room_people = bks_room_people;
	}
	public String getBks_room_id() {
		return bks_room_id;
	}
	public void setBks_room_id(String bks_room_id) {
		this.bks_room_id = bks_room_id;
	}
	public String getBks_room_kind() {
		return bks_room_kind;
	}
	public void setBks_room_kind(String bks_room_kind) {
		this.bks_room_kind = bks_room_kind;
	}
	public String getBks_room_info() {
		return bks_room_info;
	}
	public void setBks_room_info(String bks_room_info) {
		this.bks_room_info = bks_room_info;
	}
	
	public int getBks_room_price() {
		return bks_room_price;
	}
	public void setBks_room_price(int bks_room_price) {
		this.bks_room_price = bks_room_price;
	}
	public int getBks_room_sale_price() {
		return bks_room_sale_price;
	}
	public void setBks_room_sale_price(int bks_room_sale_price) {
		this.bks_room_sale_price = bks_room_sale_price;
	}
	public String getBks_checkin() {
		return bks_checkin;
	}
	public void setBks_checkin(String bks_checkin) {
		this.bks_checkin = bks_checkin;
	}
	public String getBks_checkout() {
		return bks_checkout;
	}
	public void setBks_checkout(String bks_checkout) {
		this.bks_checkout = bks_checkout;
	}
	
	@Override
	public String toString() {
		return "roomVO [bks_room_id=" + bks_room_id + ", bks_room_kind=" + bks_room_kind + ", bks_room_area="
				+ bks_room_area + ", bks_room_info=" + bks_room_info + ", bks_room_state=" + bks_room_state
				+ ", bks_room_people=" + bks_room_people + ", bks_room_price=" + bks_room_price
				+ ", bks_room_sale_price=" + bks_room_sale_price + ", bks_checkin=" + bks_checkin + ", bks_checkout="
				+ bks_checkout + "]";
	}
	
	
	
	

	
	
	
	
	
	
	
}

