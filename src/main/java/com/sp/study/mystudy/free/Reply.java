package com.sp.study.mystudy.free;

public class Reply {
	private int sfReplyNum, sFreeNum, listNum;
	private String userId, userName, sfrContent, created;
	
	public int getSfReplyNum() {
		return sfReplyNum;
	}
	public void setSfReplyNum(int sfReplyNum) {
		this.sfReplyNum = sfReplyNum;
	}
	public int getsFreeNum() {
		return sFreeNum;
	}
	public void setsFreeNum(int sFreeNum) {
		this.sFreeNum = sFreeNum;
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
	public String getSfrContent() {
		return sfrContent;
	}
	public void setSfrContent(String sfrContent) {
		this.sfrContent = sfrContent;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	
}
