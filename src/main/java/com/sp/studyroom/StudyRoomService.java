package com.sp.studyroom;

import java.util.List;
import java.util.Map;

public interface StudyRoomService {
	public int insertStudyRoom(StudyRoom dto);
	public int checkNum(StudyRoomTable tdto);
	public int insertRooms(StudyRoom dto);
	public int insertRoomDetails(StudyRoom dto);
	public List<StudyRoom> listStudyRoom(Map<String, Object> map);
	public int insertFile(StudyRoom dto, String pathname);
	public List<StudyRoomFile> fileList(int num);
	public int countNum(StudyRoomTable tdto);
	public StudyRoom studyRoom(int cafeNum);
	public List<StudyRoomDetail> studyRoomList(int num);
	public List<StudyRoomDetail> studyRoomDetailList(int num);
	public int insertCafeWish(StudyRoom dto);
	public int insertCafeWishDetail(StudyRoom dto);
	public List<StudyRoom> listCafeWish(int userNum);
	public List<StudyRoomDetail> listCafeWishDetail(int reserveNum);
	public StudyRoom checkCafeNum(int roomNum);
	public StudyRoomDetail checkCafeWishRoom(int roomNum);
	public int deleteBag(int reserveNum);
	public int deleteBagDetail(int reserveNum);
}
