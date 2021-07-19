package com.itbank.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class QnaDTO {
	
	private int idx, qnaproductidx;
	private String qnawriter, qnatitle, qnacontent, qnaimg, qnaresult, qnadate, qnamenu;

	private List<MultipartFile> files;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getQnaproductidx() {
		return qnaproductidx;
	}

	public void setQnaproductidx(int qnaproductidx) {
		this.qnaproductidx = qnaproductidx;
	}

	public String getQnawriter() {
		return qnawriter;
	}

	public void setQnawriter(String qnawriter) {
		this.qnawriter = qnawriter;
	}

	public String getQnatitle() {
		return qnatitle;
	}

	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}

	public String getQnacontent() {
		return qnacontent;
	}

	public void setQnacontent(String qnacontent) {
		this.qnacontent = qnacontent;
	}

	public String getQnaimg() {
		return qnaimg;
	}

	public void setQnaimg(String qnaimg) {
		this.qnaimg = qnaimg;
	}

	public String getQnaresult() {
		return qnaresult;
	}

	public void setQnaresult(String qnaresult) {
		this.qnaresult = qnaresult;
	}

	public String getQnadate() {
		return qnadate;
	}

	public void setQnadate(String qnadate) {
		this.qnadate = qnadate;
	}

	public String getQnamenu() {
		return qnamenu;
	}

	public void setQnamenu(String qnamenu) {
		this.qnamenu = qnamenu;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
}
