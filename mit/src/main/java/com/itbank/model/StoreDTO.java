package com.itbank.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class StoreDTO {

	private int idx, pdprice, pdcount;
	private String pdtitle, pdcontent, pdcode, pdname, pdcolor, pddate, pdimg;
	private List<MultipartFile> files;
	private List<String> filename, pdcodename;

	public List<String> getPdcodename() {
		return pdcodename;
	}
	public void setPdcodename(List<String> pdcodename) {
		this.pdcodename = pdcodename;
	}
	public List<String> getFilename() {
		return filename;
	}
	public void setFilename(List<String> filename) {
		this.filename = filename;
	}
	public String getPdimg() {
		return pdimg;
	}
	public void setPdimg(String pdimg) {
		this.pdimg = pdimg;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getPdprice() {
		return pdprice;
	}
	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}
	public int getPdcount() {
		return pdcount;
	}
	public void setPdcount(int pdcount) {
		this.pdcount = pdcount;
	}
	public String getPdtitle() {
		return pdtitle;
	}
	public void setPdtitle(String pdtitle) {
		this.pdtitle = pdtitle;
	}
	public String getPdcontent() {
		return pdcontent;
	}
	public void setPdcontent(String pdcontent) {
		this.pdcontent = pdcontent;
	}
	public String getPddate() {
		return pddate;
	}
	public void setPddate(String pddate) {
		this.pddate = pddate;
	}
	public String getPdcode() {
		return pdcode;
	}
	public void setPdcode(String pdcode) {
		this.pdcode = pdcode;
	}
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public String getPdcolor() {
		return pdcolor;
	}
	public void setPdcolor(String pdcolor) {
		this.pdcolor = pdcolor;
	}
	
	
	
}
