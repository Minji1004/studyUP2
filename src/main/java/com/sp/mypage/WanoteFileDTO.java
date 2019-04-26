package com.sp.mypage;

public class WanoteFileDTO {
	private String userId;
	private String originalFilename;
	private String saveFilename;
	protected String getUserId() {
		return userId;
	}
	protected void setUserId(String userId) {
		this.userId = userId;
	}
	protected String getOriginalFilename() {
		return originalFilename;
	}
	protected void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	protected String getSaveFilename() {
		return saveFilename;
	}
	protected void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
}
