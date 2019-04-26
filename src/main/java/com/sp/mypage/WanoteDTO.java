package com.sp.mypage;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class WanoteDTO {
	private int waNum;
	private String userId;
	private String subject;
	private String content;
	private List<MultipartFile> upload;
	protected int getWaNum() {
		return waNum;
	}
	protected void setWaNum(int waNum) {
		this.waNum = waNum;
	}
	protected String getUserId() {
		return userId;
	}
	protected void setUserId(String userId) {
		this.userId = userId;
	}
	protected String getSubject() {
		return subject;
	}
	protected void setSubject(String subject) {
		this.subject = subject;
	}
	protected String getContent() {
		return content;
	}
	protected void setContent(String content) {
		this.content = content;
	}
	protected List<MultipartFile> getUpload() {
		return upload;
	}
	protected void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
}
