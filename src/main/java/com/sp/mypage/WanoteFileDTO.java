package com.sp.mypage;

public class WanoteFileDTO {
	private int wanoteFileNum;
	private int waNum;
	private String originalFilename;
	private String saveFilename;

	public int getWanoteFileNum() {
		return wanoteFileNum;
	}
	public void setWanoteFileNum(int wanoteFileNum) {
		this.wanoteFileNum = wanoteFileNum;
	}
	public int getWaNum() {
		return waNum;
	}
	public void setWaNum(int waNum) {
		this.waNum = waNum;
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
}
