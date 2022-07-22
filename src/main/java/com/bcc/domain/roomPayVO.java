package com.bcc.domain;

public class roomPayVO {

	private String accId;
	private String accKind;
	private String accName;
	private int accAmount;
	private String email;
	private String user_name;
	private String tel;
	private String zip;
	private String id;
	private String sort;
	private String roomSort;
	private String endTime;
	private String useTime;
	private String checkIn;
	private String checkOut;
	private String status;
	private String accDate;
	private int license;
	
	public String getAccId() {
		return accId;
	}
	public void setAccId(String accId) {
		this.accId = accId;
	}
	public String getAccKind() {
		return accKind;
	}
	public void setAccKind(String accKind) {
		this.accKind = accKind;
	}
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public int getAccAmount() {
		return accAmount;
	}
	public void setAccAmount(int accAmount) {
		this.accAmount = accAmount;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getRoomSort() {
		return roomSort;
	}
	public void setRoomSort(String roomSort) {
		this.roomSort = roomSort;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getUseTime() {
		return useTime;
	}
	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAccDate() {
		return accDate;
	}
	public void setAccDate(String accDate) {
		this.accDate = accDate;
	}
	public int getLicense() {
		return license;
	}
	public void setLicense(int license) {
		this.license = license;
	}
	@Override
	public String toString() {
		return "roomPayVO [accId=" + accId + ", accKind=" + accKind + ", accName=" + accName + ", accAmount="
				+ accAmount + ", email=" + email + ", user_name=" + user_name + ", tel=" + tel + ", zip=" + zip
				+ ", id=" + id + ", sort=" + sort + ", roomSort=" + roomSort + ", endTime=" + endTime + ", useTime="
				+ useTime + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", status=" + status + ", accDate="
				+ accDate + ", license=" + license + "]";
	}
	
	
	
	
	
}
