package com.sp.admin.member;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private int mlistNum;
	private int userNum;
	private String userId, nickname, userPwd, created, updated, lastLogin;
	private String tel;
	private String birth;
	private MultipartFile pictureM;
	private String picture;
	private int enabled;
	private int blicenseNum;
	private int blicenseKindNum;
	private String isAdmin;

	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getUpdated() {
		return updated;
	}
	public void setUpdated(String updated) {
		this.updated = updated;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public MultipartFile getPictureM() {
		return pictureM;
	}
	public void setPictureM(MultipartFile pictureM) {
		this.pictureM = pictureM;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public int getBlicenseNum() {
		return blicenseNum;
	}
	public void setBlicenseNum(int blicenseNum) {
		this.blicenseNum = blicenseNum;
	}
	public int getBlicenseKindNum() {
		return blicenseKindNum;
	}
	public void setBlicenseKindNum(int blicenseKindNum) {
		this.blicenseKindNum = blicenseKindNum;
	}
	public int getMlistNum() {
		return mlistNum;
	}
	public void setMlistNum(int mlistNum) {
		this.mlistNum = mlistNum;
	}
	
}
