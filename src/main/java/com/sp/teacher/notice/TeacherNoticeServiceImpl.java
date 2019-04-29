package com.sp.teacher.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("teacher.notice.teacherNoticeService")
public class TeacherNoticeServiceImpl implements TeacherNoticeService{

	@Autowired
	CommonDAO dao;
	
	@Autowired
	FileManager fileManager;
	
	@Override
	public void insertNotice(TeacherNotice dto, String pathname) throws Exception {
				
		try {			
			int maxNum = dao.selectOne("tnotice.maxNoticeNum");
			int tnoticeNum = maxNum+1;
			dto.setTnoticeNum(tnoticeNum);
			
			dao.insertData("tnotice.insertNotice", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
						String originalFilename=mf.getOriginalFilename();
						long fileSize=mf.getSize();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						dto.setFileSize(fileSize);
						
						insertFile(dto);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	
	}
	
	@Override
	public int insertFile(TeacherNotice dto) {
		int result=0;
		try {
			result=dao.insertData("tnotice.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result =0;
		
		try {
			result = dao.selectOne("tnotice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<TeacherNotice> listTNotice(Map<String, Object> map) throws Exception {
		
		List<TeacherNotice> list = null;
		
		try {
			list = dao.selectList("tnotice.listTNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<TeacherNotice> listNoticeTop() throws Exception {
		List<TeacherNotice> list = null;
		
		try {
			list = dao.selectList("tnotice.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public TeacherNotice readTeacherNotice(int tnoticeNum) throws Exception {
		
		TeacherNotice teacherNotice = null;
		
		try {
			teacherNotice = dao.selectOne("tnotice.readTeacherNotice", tnoticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return teacherNotice;
	}

	@Override
	public void updateHitCount(int tnoticeNum) throws Exception {
		
		try {
			dao.updateData("tnotice.updateHitCount", tnoticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<TeacherNotice> listFile(int tnoticeNum) throws Exception {
		
		List<TeacherNotice> listFile = null;
		
		try {
			listFile = dao.selectList("tnotice.selectListFile", tnoticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}
	
}