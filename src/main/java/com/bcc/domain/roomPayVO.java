package com.bcc.domain;

public class roomPayVO {

	private String accId;
	private String accKind;
	private String accName;
	private int accAmount;
	private String userEmail;
	private String userName;
	private String userTel;
	private String userAddr;
	private String userPostcode;
	private String userId;
	private String sort;
	private String roomSort;
	private String endTime;
	private String useTime;
	private String checkIn;
	private String checkOut;
	
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
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserPostcode() {
		return userPostcode;
	}
	public void setUserPostcode(String userPostcode) {
		this.userPostcode = userPostcode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	@Override
	public String toString() {
		return "roomPayVO [accId=" + accId + ", accKind=" + accKind + ", accName=" + accName + ", accAmount="
				+ accAmount + ", userEmail=" + userEmail + ", userName=" + userName + ", userTel=" + userTel
				+ ", userAddr=" + userAddr + ", userPostcode=" + userPostcode + ", userId=" + userId + ", sort=" + sort
				+ ", roomSort=" + roomSort + ", endTime=" + endTime + ", useTime=" + useTime + ", checkIn=" + checkIn
				+ ", checkOut=" + checkOut + "]";
	}
	
	
	
	
	
}
