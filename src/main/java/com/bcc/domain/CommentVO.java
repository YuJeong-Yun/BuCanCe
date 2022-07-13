package com.bcc.domain;

import java.sql.Date;

public class CommentVO {
	
	private Integer num; //글 번호
	private int cno; // 댓글 번호
	private String content; // 댓글 내용
	private String writer; // 댓글 작성자
	private Date regdate; //댓글 작성 시간
	
	public CommentVO() {} 
	public CommentVO(int num, int cno, String content, String writer, Date regdate) {
		super();
		this.num = num;
		this.cno = cno;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
	}
	public int getnum() {
		return num;
	}
	public void setnum(int num) {
		this.num = num;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "CommentVO [num=" + num + ", cno=" + cno + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + "]";
	}	
	

}
