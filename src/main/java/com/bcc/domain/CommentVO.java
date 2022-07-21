package com.bcc.domain;

import java.sql.Date;

public class CommentVO {
	
	private Integer num; //글 번호
	private Integer cno; // 댓글 번호
	private String content; // 댓글 내용
	private String writer; // 댓글 작성자
	private Date regdate; //댓글 작성 시간
	private int visit;
	
	public CommentVO() {}
	public CommentVO(Integer num, int cno, String content, String writer, Date regdate, int visit) {
		super();
		this.num = num;
		this.cno = cno;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.visit = visit;
	}


	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
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

	public int getVisit() {
		return visit;
	}

	public void setVisit(int visit) {
		this.visit = visit;
	}

	@Override
	public String toString() {
		return "CommentVO [num=" + num + ", cno=" + cno + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", visit=" + visit + "]";
	} 
	
	
}