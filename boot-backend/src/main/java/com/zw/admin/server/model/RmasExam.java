package com.zw.admin.server.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class RmasExam extends BaseEntity<Long> {

	private String examName;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date examDate;
	private String context;
	private Integer grade;
	private Integer term;

	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public Integer getTerm() {
		return term;
	}
	public void setTerm(Integer term) {
		this.term = term;
	}

}
