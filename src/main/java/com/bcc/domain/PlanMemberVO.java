package com.bcc.domain;

public class PlanMemberVO {
	private int num;
	private String id;
	private int grp_num;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getGrp_num() {
		return grp_num;
	}

	public void setGrp_num(int grp_num) {
		this.grp_num = grp_num;
	}

	@Override
	public String toString() {
		return "PlanMemberVO [num=" + num + ", id=" + id + ", grp_num=" + grp_num + "]";
	}

}
