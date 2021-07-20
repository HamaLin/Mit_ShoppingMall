package com.itbank.model;

public class WishListDTO {
	
	private int idx, pdidx;
	private String userid, usergender, wldate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPdidx() {
		return pdidx;
	}
	public void setPdidx(int pdidx) {
		this.pdidx = pdidx;
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
	public String getWldate() {
		return wldate;
	}
	public void setWldate(String wldate) {
		this.wldate = wldate;
	}
	
	

}
