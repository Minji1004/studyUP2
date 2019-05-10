package com.sp.timer;

public class Timer {
	private int timerNum;
	private String userId;
	private String eTime;
	private String sTime;
	private int goalNum;
	private int pureStudyTime;
	
	public int getTimerNum() {
		return timerNum;
	}
	public void setTimerNum(int timerNum) {
		this.timerNum = timerNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String geteTime() {
		return eTime;
	}
	public void seteTime(String eTime) {
		this.eTime = eTime;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public int getGoalNum() {
		return goalNum;
	}
	public void setGoalNum(int goalNum) {
		this.goalNum = goalNum;
	}
	public int getPureStudyTime() {
		return pureStudyTime;
	}
	public void setPureStudyTime(int pureStudyTime) {
		this.pureStudyTime = pureStudyTime;
	}
	
}
