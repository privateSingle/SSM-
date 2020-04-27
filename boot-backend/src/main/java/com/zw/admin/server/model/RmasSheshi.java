package com.zw.admin.server.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class RmasSheshi extends BaseEntity<Long> {

	private String title;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date bxDate;
	private String bxUser;
	private String tell;
	private String content;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getBxDate() {
		return bxDate;
	}
	public void setBxDate(Date bxDate) {
		this.bxDate = bxDate;
	}
	public String getBxUser() {
		return bxUser;
	}
	public void setBxUser(String bxUser) {
		this.bxUser = bxUser;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}
