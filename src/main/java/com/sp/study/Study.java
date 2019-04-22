package com.sp.study;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Study {
	private int studyNum, headcount;
	private String studyName, studyIntro;
	private String userId;
	private String userName;
	private String studyLocation;
	private String studySday, studyEday;
	private String studyImg;
	private MultipartFile upload;
	
	// jsp의 checkbox 이름
	private List<Integer> courseNums;
	
	// jsp의 checkbox 이름
	private List<Integer> courseNames;
	
	public int getStudyNum() {
		return studyNum;
	}
	public void setStudyNum(int studyNum) {
		this.studyNum = studyNum;
	}
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}
	public String getStudyName() {
		return studyName;
	}
	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}
	public String getStudyIntro() {
		return studyIntro;
	}
	public void setStudyIntro(String studyIntro) {
		this.studyIntro = studyIntro;
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
	public String getStudyLocation() {
		return studyLocation;
	}
	public void setStudyLocation(String studyLocation) {
		this.studyLocation = studyLocation;
	}
	public String getStudySday() {
		return studySday;
	}
	public void setStudySday(String studySday) {
		this.studySday = studySday;
	}
	public String getStudyEday() {
		return studyEday;
	}
	public void setStudyEday(String studyEday) {
		this.studyEday = studyEday;
	}
	public String getStudyImg() {
		return studyImg;
	}
	public void setStudyImg(String studyImg) {
		this.studyImg = studyImg;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public List<Integer> getCourseNums() {
		return courseNums;
	}
	public void setCourseNums(List<Integer> courseNums) {
		this.courseNums = courseNums;
	}
	public List<Integer> getCourseNames() {
		return courseNames;
	}
	public void setCourseNames(List<Integer> courseNames) {
		this.courseNames = courseNames;
	}	
}
