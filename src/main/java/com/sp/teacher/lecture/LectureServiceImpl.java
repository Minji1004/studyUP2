package com.sp.teacher.lecture;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;
import com.sp.study.StudyCourse;
import com.sp.teacher.Teacher;

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
			
			maxNum = dao.selectOne("lecture.maxStudyNum");
			int studyNum = maxNum+1;
			
			dto.setStudyNum(studyNum);
			
			dao.insertData("lecture.insertStudy", dto);			
			
			if(dto.getCourseNums() != null) {
				StudyCourse sdto;
				for(int s : dto.getCourseNums()) {
					sdto = new StudyCourse();
					
					sdto.setStudyNum(studyNum);
					sdto.setCourseNum(s);
					dao.insertData("study.insertStudyCourse", sdto);
				}				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Lecture> readLectureList(Teacher dto) throws Exception {
		List<Lecture> list = null;
		
		try {			
			list = dao.selectList("lecture.readLectureList", dto);	
			
			for(Lecture lecture : list) {
				
				int studyNum = lecture.getStudyNum();
				
				String categoryName = dao.selectOne("lecture.readCategoryName", studyNum);
				lecture.setCategoryName(categoryName);
				
				List<String> courseName = dao.selectList("lecture.readCourseList", studyNum);
				lecture.setCourseName(courseName);
				
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

}
