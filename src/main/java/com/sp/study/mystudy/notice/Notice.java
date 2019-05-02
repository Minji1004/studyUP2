package com.sp.study.mystudy.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int sNoticeNum, studyNum, notice;
	private int listNum;
	
	private String userId, userName, nSubject, nContent, created;
	private int hitCount;
	
	private int snFileNum;
	private String originalFilename, saveFilename;
	private long fileSize;
	
	private List<MultipartFile> upload;
	
	private long gap;

	public int getsNoticeNum() {
		return sNoticeNum;
	}

	public void setsNoticeNum(int sNoticeNum) {
		this.sNoticeNum = sNoticeNum;
	}

	public int getStudyNum() {
		return studyNum;
	}

	public void setStudyNum(int studyNum) {
		this.studyNum = studyNum;
	}

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}
	
	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getnSubject() {
		return nSubject;
	}

	public void setnSubject(String nSubject) {
		this.nSubject = nSubject;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
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

	public int getSnFileNum() {
		return snFileNum;
	}

	public void setSnFileNum(int snFileNum) {
		this.snFileNum = snFileNum;
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

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public long getGap() {
		return gap;
	}

	public void setGap(long gap) {
		this.gap = gap;
	}
	
}
