package com.sp.teacher.lecture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("teacher.lecture.lectureService")
public class LectureServiceImpl implements LectureService{

	@Autowired
	private FileManager fileManger;
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertLecture(Lecture dto, String pathname) throws Exception {
		try {
			if(dto.getUpload() != null && ! dto.getUpload().isEmpty()) {
				String studyImg = fileManger.doFileUpload(dto.getUpload(), pathname);
				dto.setStudyImg(studyImg);
			}
			
			int maxNum = dao.selectOne("lecture.maxLectureNum");
			int lectureNum = maxNum+1;
			
			dto.setLectureNum(lectureNum);

			dao.insertData("lecture.insertLecture", dto);
			
			
	/*		
			if(dto.getCourseNums() != null) {
				StudyCourse sdto;
				for(int s : dto.getCourseNums()) {
					sdto = new StudyCourse();
					
					sdto.setStudyNum(studyNum);
					sdto.setCourseNum(s);
					dao.insertData("study.insertStudyCourse", sdto);
				}				
			}
			*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
