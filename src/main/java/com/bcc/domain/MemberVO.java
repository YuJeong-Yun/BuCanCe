package com.bcc.domain;

import java.sql.Date;

public class MemberVO {
	// VO(Value Object) => DTO의 동작과 동일하게 사용
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String tel;
	private String zip;
	private String address1;
	private String address2;
	private Date regdate;
	private String license;
	
	public MemberVO() {	} // 생성자를 오버로딩하면 기본생성자는 자동생성 X
	// alt shift s + o

	public MemberVO(String id, String pw, String name, String email, String tel, String zip, String address1,
			String address2, Date regdate, String license) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.zip = zip;
		this.address1 = address1;
		this.address2 = address2;
		this.regdate = regdate;
		this.license = license;
	}

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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
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
