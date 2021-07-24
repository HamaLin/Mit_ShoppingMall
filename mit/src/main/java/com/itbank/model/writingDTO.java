package com.itbank.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class writingDTO {

	private int idx,scope, pdidx;
	private String writer,wr, img;
	private List<MultipartFile> files;
	
	public int getPdidx() {
		return pdidx;
	}
	public void setPdidx(int pdidx) {
		this.pdidx = pdidx;
	}
	
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getScope() {
		return scope;
	}
	public void setScope(int scope) {
		this.scope = scope;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWr() {
		return wr;
	}
	public void setWr(String wr) {
		this.wr = wr;
	}
	
	
}
