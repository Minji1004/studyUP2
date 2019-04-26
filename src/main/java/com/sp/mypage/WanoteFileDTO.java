package com.sp.mypage;

public class WanoteFileDTO {
	private int waNum;
	private String originalFilename;
	private String saveFilename;
	
	protected int getWaNum() {
		return waNum;
	}
	protected void setWaNum(int waNum) {
		this.waNum = waNum;
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
