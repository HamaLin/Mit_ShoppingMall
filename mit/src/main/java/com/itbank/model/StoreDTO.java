package com.itbank.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class StoreDTO {

	private int idx, pdprice, pdscount, pdmcount, pdlcount, pdxlcount;
	private String pdtitle, pdcontent, pdcode, pdname, pdcolor, pddate, pdimg, pdwriter, mainimg, viewimg;
	private List<MultipartFile> files;
	private List<String> filename, pdcodename, viewimglist;
	
	public String getViewimg() {
		return viewimg;
	}
	public void setViewimg(String viewimg) {
		this.viewimg = viewimg;
	}
	public List<String> getViewimglist() {
		return viewimglist;
	}
	public void setViewimglist(List<String> viewimglist) {
		this.viewimglist = viewimglist;
	}
	public int getPdscount() {
		return pdscount;
	}
	public void setPdscount(int pdscount) {
		this.pdscount = pdscount;
	}
	public int getPdmcount() {
		return pdmcount;
	}
	public void setPdmcount(int pdmcount) {
		this.pdmcount = pdmcount;
	}
	public int getPdlcount() {
		return pdlcount;
	}
	public void setPdlcount(int pdlcount) {
		this.pdlcount = pdlcount;
	}
	public int getPdxlcount() {
		return pdxlcount;
	}
	public void setPdxlcount(int pdxlcount) {
		this.pdxlcount = pdxlcount;
	}
	
	public String getMainimg() {
		return mainimg;
	}
	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}
	
	public String getPdwriter() {
		return pdwriter;
	}
	public void setPdwriter(String pdwriter) {
		this.pdwriter = pdwriter;
	}
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
