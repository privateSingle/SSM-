package com.zw.admin.server.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class RmasStudentThings extends BaseEntity<Long> {

	private String title;
	private String context;
	private String stuName;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private String imgUrl;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}
