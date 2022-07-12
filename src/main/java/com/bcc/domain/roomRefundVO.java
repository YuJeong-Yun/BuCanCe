package com.bcc.domain;

public class roomRefundVO {

	private String accId;
	private int accAmount;
	private String accName;
	private String roomSort;
	private String sort;
	private String accKind;
	private String checkIn;
	private String checkOut;
	private String id;
	private int license;
	public String getAccId() {
		return accId;
	}
	public void setAccId(String accId) {
		this.accId = accId;
	}
	public int getAccAmount() {
		return accAmount;
	}
	public void setAccAmount(int accAmount) {
		this.accAmount = accAmount;
	}
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public String getRoomSort() {
		return roomSort;
	}
	public void setRoomSort(String roomSort) {
		this.roomSort = roomSort;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getAccKind() {
		return accKind;
	}
	public void setAccKind(String accKind) {
		this.accKind = accKind;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLicense() {
		return license;
	}
	public void setLicense(int license) {
		this.license = license;
	}
	@Override
	public String toString() {
		return "roomRefundVO [accId=" + accId + ", accAmount=" + accAmount + ", accName=" + accName + ", roomSort="
				+ roomSort + ", sort=" + sort + ", accKind=" + accKind + ", checkIn=" + checkIn + ", checkOut="
				+ checkOut + ", id=" + id + ", license=" + license + "]";
	}

	

	
}
