package com.sp.study;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("study.studyService")
public class StudyServiceImpl implements StudyService{	
	@Autowired
	private CommonDAO dao;	
	@Autowired
	private FileManager fileManger;
	

	@Override
	public int insertStudy(Study dto, String pathname) {
		int result = 0;
		
		try {
			if(dto.getUpload() != null && ! dto.getUpload().isEmpty()) {
				String studyImg = fileManger.doFileUpload(dto.getUpload(), pathname);
				dto.setStudyImg(studyImg);
			}
			
			int maxNum = dao.selectOne("study.maxStudyNum");
			int studyNum = maxNum+1;
			
			dto.setStudyNum(studyNum);

			dao.insertData("study.insertStudy", dto);
			
			if(dto.getCourseNums() != null) {
				StudyCourse sdto;
				for(int s : dto.getCourseNums()) {
					sdto = new StudyCourse();
					
					sdto.setStudyNum(studyNum);
					sdto.setCourseNum(s);
					dao.insertData("study.insertStudyCourse", sdto);
				}				
			}
			
			
			result = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Study> listStudy(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Study readStudy(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateStudy(Study dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteStudy(int num, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}


}
