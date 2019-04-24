package com.sp.studyroom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("studyroom.studyRoomService")
public class StudyRoomServiceImpl implements StudyRoomService {
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertStudyRoom(StudyRoom dto) {
		int result=0;
		try {
			
			result=dao.insertData("studyroom.insertCafe", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
