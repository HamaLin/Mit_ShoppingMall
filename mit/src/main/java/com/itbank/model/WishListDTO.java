package com.itbank.model;

public class WishListDTO {
	
	private int idx, pdidx, count, price, buythis, userage;
	private String userid, usergender, wldate, mainimg, usersize, title;
	
	public int getUserage() {
		return userage;
	}
	public void setUserage(int userage) {
		this.userage = userage;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getBuythis() {
		return buythis;
	}
	public void setBuythis(int buythis) {
		this.buythis = buythis;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMainimg() {
		return mainimg;
	}
	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}
	public String getUsersize() {
		return usersize;
	}
	public void setUsersize(String usersize) {
		this.usersize = usersize;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
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
