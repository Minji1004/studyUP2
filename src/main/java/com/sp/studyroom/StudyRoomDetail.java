package com.sp.studyroom;

import java.util.List;

public class StudyRoomDetail {
	private int roomNum;
	private int cafeNum;
	private String roomName;
	private int minUser;
	private int maxUser;
	private String timeOrRoom;
	private int unitPrice;
	private Integer checkTime;
	private List<Integer> checkTimes;
	
	public List<Integer> getCheckTimes() {
		return checkTimes;
	}
	public void setCheckTimes(List<Integer> checkTimes) {
		this.checkTimes = checkTimes;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public int getCafeNum() {
		return cafeNum;
	}
	public void setCafeNum(int cafeNum) {
		this.cafeNum = cafeNum;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getMinUser() {
		return minUser;
	}
	public void setMinUser(int minUser) {
		this.minUser = minUser;
	}
	public int getMaxUser() {
		return maxUser;
	}
	public void setMaxUser(int maxUser) {
		this.maxUser = maxUser;
	}
	public String getTimeOrRoom() {
		return timeOrRoom;
	}
	public void setTimeOrRoom(String timeOrRoom) {
		this.timeOrRoom = timeOrRoom;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Integer getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Integer checkTime) {
		this.checkTime = checkTime;
	}
	
	
}
