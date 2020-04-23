package com.zw.admin.server.model;

import java.math.BigDecimal;


public class Wzapply extends BaseEntity<Long> {

	private String wztype;
	private String wzaddress;
	private BigDecimal wzprice;
	private BigDecimal wzbigprice;
	private Integer wznum;

	public String getWztype() {
		return wztype;
	}
	public void setWztype(String wztype) {
		this.wztype = wztype;
	}
	public String getWzaddress() {
		return wzaddress;
	}
	public void setWzaddress(String wzaddress) {
		this.wzaddress = wzaddress;
	}
	public BigDecimal getWzprice() {
		return wzprice;
	}
	public void setWzprice(BigDecimal wzprice) {
		this.wzprice = wzprice;
	}
	public BigDecimal getWzbigprice() {
		return wzbigprice;
	}
	public void setWzbigprice(BigDecimal wzbigprice) {
		this.wzbigprice = wzbigprice;
	}
	public Integer getWznum() {
		return wznum;
	}
	public void setWznum(Integer wznum) {
		this.wznum = wznum;
	}

}
