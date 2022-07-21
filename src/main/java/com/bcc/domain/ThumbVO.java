package com.bcc.domain;

public class ThumbVO {
	private int num;
	private int b_num;
	private int b_category;
	private String m_id;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public int getB_category() {
		return b_category;
	}
	public void setB_category(int b_category) {
		this.b_category = b_category;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
	@Override
	public String toString() {
		return "ThumbVO [num=" + num + ", b_num=" + b_num + ", b_category=" + b_category + ", m_id=" + m_id + "]";
	}
	
}
