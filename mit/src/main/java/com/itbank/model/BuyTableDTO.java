package com.itbank.model;

public class BuyTableDTO {
	
	private int idx, pdidx, count, total;
	private String userid, usergender, buydate, usersize, userage;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPdidx() {
		return pdidx;
	}
	public String getUserage() {
		return userage;
	}
	public void setUserage(String userage) {
		this.userage = userage;
	}
	public void setPdidx(int pdidx) {
		this.pdidx = pdidx;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}
	public String getBuydate() {
		return buydate;
	}
	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}
	public String getUsersize() {
		return usersize;
	}
	public void setUsersize(String usersize) {
		this.usersize = usersize;
	}
	
	

}
