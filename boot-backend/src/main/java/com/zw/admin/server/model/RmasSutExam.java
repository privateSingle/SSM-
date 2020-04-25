package com.zw.admin.server.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

public class RmasSutExam extends BaseEntity<Long> {

	private Integer examId;
	private String examName;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date examDate;
	private Integer grade;
	private Integer term;
	private String stuId;
	private String stuName;
	private BigDecimal yuwen;
	private BigDecimal yuwenJc;
	private BigDecimal yuwenyd;
	private BigDecimal yuwenZw;
	private BigDecimal shuxue;
	private BigDecimal shuxueXz;
	private BigDecimal shuxueJs;
	private BigDecimal english;
	private BigDecimal sipin;
	private BigDecimal zf;
	private String context;

	public Integer getExamId() {
		return examId;
	}
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
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
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public BigDecimal getYuwen() {
		return yuwen;
	}
	public void setYuwen(BigDecimal yuwen) {
		this.yuwen = yuwen;
	}
	public BigDecimal getYuwenJc() {
		return yuwenJc;
	}
	public void setYuwenJc(BigDecimal yuwenJc) {
		this.yuwenJc = yuwenJc;
	}
	public BigDecimal getYuwenyd() {
		return yuwenyd;
	}
	public void setYuwenyd(BigDecimal yuwenyd) {
		this.yuwenyd = yuwenyd;
	}
	public BigDecimal getYuwenZw() {
		return yuwenZw;
	}
	public void setYuwenZw(BigDecimal yuwenZw) {
		this.yuwenZw = yuwenZw;
	}
	public BigDecimal getShuxue() {
		return shuxue;
	}
	public void setShuxue(BigDecimal shuxue) {
		this.shuxue = shuxue;
	}
	public BigDecimal getShuxueXz() {
		return shuxueXz;
	}
	public void setShuxueXz(BigDecimal shuxueXz) {
		this.shuxueXz = shuxueXz;
	}
	public BigDecimal getShuxueJs() {
		return shuxueJs;
	}
	public void setShuxueJs(BigDecimal shuxueJs) {
		this.shuxueJs = shuxueJs;
	}
	public BigDecimal getEnglish() {
		return english;
	}
	public void setEnglish(BigDecimal english) {
		this.english = english;
	}
	public BigDecimal getSipin() {
		return sipin;
	}
	public void setSipin(BigDecimal sipin) {
		this.sipin = sipin;
	}
	public BigDecimal getZf() {
		return zf;
	}
	public void setZf(BigDecimal zf) {
		this.zf = zf;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}

}
