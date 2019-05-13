package com.sp.study.mystudy.free;

import org.springframework.web.multipart.MultipartFile;

public class Board {	
	private int listNum, sFreeNum, studyNum;
	private String userName, userId, fSubject, fContent, created;
	private int hitCount;
	private MultipartFile upload;
	
	private String originalFilename, saveFilename;
	
	private int replyCount;


	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	
	public int getsFreeNum() {
		return sFreeNum;
	}

	public void setsFreeNum(int sFreeNum) {
		this.sFreeNum = sFreeNum;
	}

	public int getStudyNum() {
		return studyNum;
	}

	public void setStudyNum(int studyNum) {
		this.studyNum = studyNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getfSubject() {
		return fSubject;
	}

	public void setfSubject(String fSubject) {
		this.fSubject = fSubject;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getSaveFilename() {
		return saveFilename;
	}

	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

}
