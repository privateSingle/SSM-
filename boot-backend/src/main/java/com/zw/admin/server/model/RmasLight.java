package com.zw.admin.server.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class RmasLight extends BaseEntity<Long> {

	private String title;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date date;
	private String type;
	private String room;
	private String content;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}
