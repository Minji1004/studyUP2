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
}
