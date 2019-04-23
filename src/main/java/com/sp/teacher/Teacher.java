package com.sp.teacher;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public class Teacher {

	private int userNum;
	private String userId, nickname, userPwd, content;
	private String tel;
	private List<Map<String, String>> subject;
	private MultipartFile pictureM;
	private String picture;
	private int enabled;
	
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<Map<String, String>> getSubject() {
		return subject;
	}
	public void setSubject(List<Map<String, String>> subject) {
		this.subject = subject;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
}
