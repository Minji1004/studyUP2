package com.sp.studyroom;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class StudyRoom {
	private int	userNum;
	private int roomNum;
	private List<Integer> roomNums;
	private int cafeNum;
	private String cafeName;
	private String cafeTel;
	private String cafeOwner;
	private String roadAddr;
	private String normAddr;
	private String buildName;
	private String detailAddr;
	private String bCode;
	private String sido;
	private String sigungu;
	private String bname;	
	private String cafeIntro;
	private String timeOrRoom;
	private List<String> roomNames;
	private String roomName;
	private List<Integer> unitPrices;
	private int unitPrice;
	private List<Integer> minUsers;
	private int minUser;
	private List<Integer> maxUsers;
	private int maxUser;
	private List<String> checkTimes;
	private int cafeOpen;
	private int cafeClose;
	private List<String> checkboxCounts;
	private int checkTime;
	private List<MultipartFile> upload;
	private String imgFilename;
	private String saveFilename;
	private String fileList;
	private List<StudyRoomDetail> studyRoomList;
	private String useDate;
	private int reserveNum;
	private String timelists;
	private int peopleNum;
	private int itemPrice;
	
	
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getPeopleNum() {
		return peopleNum;
	}
	public void setPeopleNum(int peopleNum) {
		this.peopleNum = peopleNum;
	}
	public String getTimelists() {
		return timelists;
	}
	public void setTimelists(String timelists) {
		this.timelists = timelists;
	}
	public int getReserveNum() {
		return reserveNum;
	}
	public void setReserveNum(int reserveNum) {
		this.reserveNum = reserveNum;
	}
	public String getUseDate() {
		return useDate;
	}
	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}
	public List<Integer> getRoomNums() {
		return roomNums;
	}
	public void setRoomNums(List<Integer> roomNums) {
		this.roomNums = roomNums;
	}
	public List<StudyRoomDetail> getStudyRoomList() {
		return studyRoomList;
	}
	public void setStudyRoomList(List<StudyRoomDetail> studyRoomList) {
		this.studyRoomList = studyRoomList;
	}
	public int getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(int checkTime) {
		this.checkTime = checkTime;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
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
	public String getCafeName() {
		return cafeName;
	}
	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}
	public String getCafeTel() {
		return cafeTel;
	}
	public void setCafeTel(String cafeTel) {
		this.cafeTel = cafeTel;
	}
	public String getCafeOwner() {
		return cafeOwner;
	}
	public void setCafeOwner(String cafeOwner) {
		this.cafeOwner = cafeOwner;
	}
	public String getRoadAddr() {
		return roadAddr;
	}
	public void setRoadAddr(String roadAddr) {
		this.roadAddr = roadAddr;
	}
	public String getNormAddr() {
		return normAddr;
	}
	public void setNormAddr(String normAddr) {
		this.normAddr = normAddr;
	}
	public String getBuildName() {
		return buildName;
	}
	public void setBuildName(String buildName) {
		this.buildName = buildName;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public String getbCode() {
		return bCode;
	}
	public void setbCode(String bCode) {
		this.bCode = bCode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getCafeIntro() {
		return cafeIntro;
	}
	public void setCafeIntro(String cafeIntro) {
		this.cafeIntro = cafeIntro;
	}
	public String getTimeOrRoom() {
		return timeOrRoom;
	}
	public void setTimeOrRoom(String timeOrRoom) {
		this.timeOrRoom = timeOrRoom;
	}
	public List<String> getRoomNames() {
		return roomNames;
	}
	public void setRoomNames(List<String> roomNames) {
		this.roomNames = roomNames;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public List<Integer> getUnitPrices() {
		return unitPrices;
	}
	public void setUnitPrices(List<Integer> unitPrices) {
		this.unitPrices = unitPrices;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public List<Integer> getMinUsers() {
		return minUsers;
	}
	public void setMinUsers(List<Integer> minUsers) {
		this.minUsers = minUsers;
	}
	public int getMinUser() {
		return minUser;
	}
	public void setMinUser(int minUser) {
		this.minUser = minUser;
	}
	public List<Integer> getMaxUsers() {
		return maxUsers;
	}
	public void setMaxUsers(List<Integer> maxUsers) {
		this.maxUsers = maxUsers;
	}
	public int getMaxUser() {
		return maxUser;
	}
	public void setMaxUser(int maxUser) {
		this.maxUser = maxUser;
	}
	public int getCafeOpen() {
		return cafeOpen;
	}
	public void setCafeOpen(int cafeOpen) {
		this.cafeOpen = cafeOpen;
	}
	public int getCafeClose() {
		return cafeClose;
	}
	public void setCafeClose(int cafeClose) {
		this.cafeClose = cafeClose;
	}
	public List<String> getCheckTimes() {
		return checkTimes;
	}
	public void setCheckTimes(List<String> checkTimes) {
		this.checkTimes = checkTimes;
	}
	public List<String> getCheckboxCounts() {
		return checkboxCounts;
	}
	public void setCheckboxCounts(List<String> checkboxCounts) {
		this.checkboxCounts = checkboxCounts;
	}
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	public String getImgFilename() {
		return imgFilename;
	}
	public void setImgFilename(String imgFilename) {
		this.imgFilename = imgFilename;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getFileList() {
		return fileList;
	}
	public void setFileList(String fileList) {
		this.fileList = fileList;
	}

	
	
	
	
}
