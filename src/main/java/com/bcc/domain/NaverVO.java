package com.bcc.domain;

public class NaverVO {

	private long n_number;	// pk로 쓸 값
	private String n_email;
	private String n_name;
	private long n_id;
	
	
	public long getN_id() {
		return n_id;
	}
	public void setN_id(long n_id) {
		this.n_id = n_id;
	}
	
	public long getN_number() {
		return n_number;
	}
	public void setN_number(long n_number) {
		this.n_number = n_number;
	}
	public String getN_email() {
		return n_email;
	}
	public void setN_email(String n_email) {
		this.n_email = n_email;
	}
	public String getN_name() {
		return n_name;
	}
	public void setN_name(String n_name) {
		this.n_name = n_name;
	}
	
	@Override
	public String toString() {
		return "NaverVO [n_number=" + n_number + ", n_email=" + n_email + ", n_name=" + n_name + ", n_id=" + n_id + "]";
	}
	
	
	
}
