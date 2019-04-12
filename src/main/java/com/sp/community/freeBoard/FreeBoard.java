package com.sp.community.freeBoard;

public class FreeBoard {
	private int f_PostNum;
	private int userNum;
	private String Id;
	private String Subject;
	private String Content;
	private int views;
	private String c_DT;
	private int FileNum;
	private String og_FileName;
	private String sv_FileName;
	private int b_Like;
	private int r_Num;
	private int r_Like;

	private int groupNum;
	private int depth;
	private int orderNo;
	private int parent;

	public int getF_PostNum() {
		return f_PostNum;
	}

	public void setF_PostNum(int f_PostNum) {
		this.f_PostNum = f_PostNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getSubject() {
		return Subject;
	}

	public void setSubject(String subject) {
		Subject = subject;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getC_DT() {
		return c_DT;
	}

	public void setC_DT(String c_DT) {
		this.c_DT = c_DT;
	}

	public int getFileNum() {
		return FileNum;
	}

	public void setFileNum(int fileNum) {
		FileNum = fileNum;
	}

	public String getOg_FileName() {
		return og_FileName;
	}

	public void setOg_FileName(String og_FileName) {
		this.og_FileName = og_FileName;
	}

	public String getSv_FileName() {
		return sv_FileName;
	}

	public void setSv_FileName(String sv_FileName) {
		this.sv_FileName = sv_FileName;
	}

	public int getB_Like() {
		return b_Like;
	}

	public void setB_Like(int b_Like) {
		this.b_Like = b_Like;
	}

	public int getR_Num() {
		return r_Num;
	}

	public void setR_Num(int r_Num) {
		this.r_Num = r_Num;
	}

	public int getR_Like() {
		return r_Like;
	}

	public void setR_Like(int r_Like) {
		this.r_Like = r_Like;
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
