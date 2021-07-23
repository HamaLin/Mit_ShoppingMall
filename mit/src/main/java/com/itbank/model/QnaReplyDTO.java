package com.itbank.model;

public class QnaReplyDTO {

	private int idx, qnaidx;
	private String replywriter, replycontent, replydate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getQnaidx() {
		return qnaidx;
	}
	public void setQnaidx(int qnaidx) {
		this.qnaidx = qnaidx;
	}
	public String getReplywriter() {
		return replywriter;
	}
	public void setReplywriter(String replywriter) {
		this.replywriter = replywriter;
	}
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	public String getReplydate() {
		return replydate;
	}
	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}
	

}
