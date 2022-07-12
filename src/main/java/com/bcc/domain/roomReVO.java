package com.bcc.domain;

//날짜에 따른 예약정보 불러오는 vo
public class roomReVO {
	
	private String room_title;
	private String room_reserve2;
	private String accendtime;
	private String accusetime;
	private String room_lcost;
	private String room_fcost;
	private String room_endtime;
	private String room_usetime;
	private String room_pic;
	private String checkout;
	private String checkin;
	private String room_subTitle;
	private String endtime;
	private String usetime;
	private String room_rf;
	
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public String getRoom_reserve2() {
		return room_reserve2;
	}
	public void setRoom_reserve2(String room_reserve2) {
		this.room_reserve2 = room_reserve2;
	}
	public String getAccendtime() {
		return accendtime;
	}
	public void setAccendtime(String accendtime) {
		this.accendtime = accendtime;
	}
	public String getAccusetime() {
		return accusetime;
	}
	public void setAccusetime(String accusetime) {
		this.accusetime = accusetime;
	}
	public String getRoom_lcost() {
		return room_lcost;
	}
	public void setRoom_lcost(String room_lcost) {
		this.room_lcost = room_lcost;
	}
	public String getRoom_fcost() {
		return room_fcost;
	}
	public void setRoom_fcost(String room_fcost) {
		this.room_fcost = room_fcost;
	}
	public String getRoom_endtime() {
		return room_endtime;
	}
	public void setRoom_endtime(String room_endtime) {
		this.room_endtime = room_endtime;
	}
	public String getRoom_usetime() {
		return room_usetime;
	}
	public void setRoom_usetime(String room_usetime) {
		this.room_usetime = room_usetime;
	}
	public String getRoom_pic() {
		return room_pic;
	}
	public void setRoom_pic(String room_pic) {
		this.room_pic = room_pic;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getRoom_subTitle() {
		return room_subTitle;
	}
	public void setRoom_subTitle(String room_subTitle) {
		this.room_subTitle = room_subTitle;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getUsetime() {
		return usetime;
	}
	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}
	@Override
	public String toString() {
		return "roomReVO [room_title=" + room_title + ", room_reserve2=" + room_reserve2 + ", accendtime=" + accendtime
				+ ", accusetime=" + accusetime + ", room_lcost=" + room_lcost + ", room_fcost=" + room_fcost
				+ ", room_endtime=" + room_endtime + ", room_usetime=" + room_usetime + ", room_pic=" + room_pic
				+ ", checkout=" + checkout + ", checkin=" + checkin + ", room_subTitle=" + room_subTitle + ", endtime="
				+ endtime + ", usetime=" + usetime + "]";
	}
	
	
	
	
	
}
