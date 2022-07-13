package com.bcc.domain;

public class LikeVO {
	private String id;
	private int bno;
	private int like_no;
	
	public LikeVO() { }
	
	public LikeVO(String id, int bno, int like_no) {
		super();
		this.id = id;
		this.bno = bno;
		this.like_no = like_no;
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	@Override
	public String toString() {
		return "LikeVO [id=" + id + ", bno=" + bno + ", like_no=" + like_no + "]";
	}
	
	
	
	
}