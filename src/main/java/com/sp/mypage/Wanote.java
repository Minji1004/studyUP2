package com.sp.mypage;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Wanote {
	private int listNum;
	private int waNum;
	private String userId;
	private String subject;
	private String content;
	private String created;
	
	private List<MultipartFile> upload;

	
	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getWaNum() {
		return waNum;
	}

	public void setWaNum(int waNum) {
		this.waNum = waNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	
		
}
