package com.bcc.domain;

import java.sql.Time;

public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String tel;
	private String zip;
	private String address1;
	private String address2;
	private Time regdate;
	private String license;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Time getRegdate() {
		return regdate;
	}
	public void setRegdate(Time regdate) {
		this.regdate = regdate;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", tel=" + tel + ", zip="
				+ zip + ", address1=" + address1 + ", address2=" + address2 + ", regdate=" + regdate + ", license="
				+ license + "]";
	}
	
	

}
