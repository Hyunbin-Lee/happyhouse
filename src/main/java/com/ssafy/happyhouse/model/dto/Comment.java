package com.ssafy.happyhouse.model.dto;

import java.util.Date;

public class Comment {
	private int cno;
	private int bno;
	private String content;
	private String userid;
	private Date reg_date;
	
	public Comment(int cno, int bno, String content, String userid, Date reg_date) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.content = content;
		this.userid = userid;
		this.reg_date = reg_date;
	}

	public Comment() {
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "Comment [cno=" + cno + ", bno=" + bno + ", content=" + content + ", userid=" + userid + ", reg_date="
				+ reg_date + "]";
	}
	
}
