package com.itbank.model;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class CommunityDTO {
	
	private int idx ,tidx;
	private String cmtitle,cmwriter,writerimg,cmcontent,cmdate,filename;
	private List<MultipartFile>cmimg;
	

	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getTidx() {
		return tidx;
	}
	public void setTidx(int tidx) {
		this.tidx = tidx;
	}
	public List<MultipartFile> getCmimg() {
		return cmimg;
	}
	public void setCmimg(List<MultipartFile> cmimg) {
		this.cmimg = cmimg;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCmtitle() {
		return cmtitle;
	}
	public void setCmtitle(String cmtitle) {
		this.cmtitle = cmtitle;
	}
	public String getCmwriter() {
		return cmwriter;
	}
	public void setCmwriter(String cmwriter) {
		this.cmwriter = cmwriter;
	}
	public String getWriterimg() {
		return writerimg;
	}
	public void setWriterimg(String writerimg) {
		this.writerimg = writerimg;
	}
	public String getCmcontent() {
		return cmcontent;
	}
	public void setCmcontent(String cmcontent) {
		this.cmcontent = cmcontent;
	}
	
	public String getCmdate() {
		return cmdate;
	}
	public void setCmdate(String cmdate) {
		this.cmdate = cmdate;
	}
	

}
