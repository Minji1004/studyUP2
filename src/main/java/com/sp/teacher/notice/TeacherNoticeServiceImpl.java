package com.sp.teacher.notice;

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
	
}