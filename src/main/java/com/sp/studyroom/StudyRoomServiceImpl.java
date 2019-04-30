package com.sp.studyroom;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("studyroom.studyRoomService")
public class StudyRoomServiceImpl implements StudyRoomService {
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int checkNum(StudyRoomTable tdto) {
		int result=0;
		try {
			result=dao.selectOne("studyroom.searchNum", tdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
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
	
	
	
	@Override
	public int insertRooms(StudyRoom dto) {
		int result=0;
		try {
			result=dao.insertData("studyroom.insertCafeRoom", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int insertRoomDetails(StudyRoom dto) {
		int result=0;
		try {
			result=dao.insertData("studyroom.insertCafeRoomDetail", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<StudyRoom> listStudyRoom(Map<String, Object> map) {
		List<StudyRoom> list = null;
		try {
			list = dao.selectList("studyroom.listStudyRoom", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertFile(StudyRoom dto, String pathname) {
		int result=0;
		try {
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf : dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
						String filename = mf.getOriginalFilename();
						dto.setImgFilename(filename);
						dto.setSaveFilename(saveFilename);
						result=dao.insertData("studyroom.insertCafeFile", dto);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<StudyRoomFile> fileList(int num) {
		List<StudyRoomFile> list = null;
		try {
			list = dao.selectList("listStudyRoomFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
