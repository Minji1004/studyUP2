package com.sp.teacher.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TeacherNotice {
	private int tnoticeNum;
	private int listNum;
	private String tId;
	private String subject, content, created;
	private int hitCount;
	private int noticeweather;
	
	private int fileNum;
	private String originalFilename, saveFilename;
	private long fileSize;
	
	//스프링에서 파일 받기
	private List<MultipartFile> upload;
	private long gap;
	
	
	public int getTnoticeNum() {
		return tnoticeNum;
	}
	public void setTnoticeNum(int tnoticeNum) {
		this.tnoticeNum = tnoticeNum;
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
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
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
	public String gettId() {
		return tId;
	}
	public void settId(String tId) {
		this.tId = tId;
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
	public int getNoticeweather() {
		return noticeweather;
	}
	public void setNoticeweather(int noticeweather) {
		this.noticeweather = noticeweather;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}


	
	
}
