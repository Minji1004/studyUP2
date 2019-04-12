package com.sp.member;

import java.util.List;


// 세션에 저장할 정보(아이디, 이름, 권한등)
public class SessionInfo {
	private String userId;
	private String userName;
	private int userNum;
	private int memberLevel;
	private String tel;
	private List<Integer> blicenseNum;
	private List<Integer> userType;
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public List<Integer> getUserType() {
		return userType;
	}
	public void setUserType(List<Integer> userType) {
		this.userType = userType;
	}
	public List<Integer> getBlicenseNum() {
		return blicenseNum;
	}
	public void setBlicenseNum(List<Integer> blicenseNum) {
		this.blicenseNum = blicenseNum;
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
	public int getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
}
