package com.sp.community.worryBoard;

public class WorryBoard {
	private int listNum, worryPostNum;
	private int userNum;
	private String userId, nickName;
	private String subject;
	private String content;
	private int views;
	private String created;

	private int groupNum;
	private int depth;
	private int orderNo;
	private int parent;
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getWorryPostNum() {
		return worryPostNum;
	}
	public void setWorryPostNum(int worryPostNum) {
		this.worryPostNum = worryPostNum;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(int groupNum) {
		this.groupNum = groupNum;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
}
