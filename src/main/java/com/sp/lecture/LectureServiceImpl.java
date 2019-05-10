package com.sp.lecture;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.study.Study;
import com.sp.study.StudyCourse;

@Service("lecture.lectureService")
public class LectureServiceImpl implements LectureService{

	@Autowired
	CommonDAO dao;
	
	@Override
	public List<Study> listStudy(Map<String, Object> map) {
		List<Study> list = null;
		
		try {
			list = dao.selectList("lecture.listLecture", map);	
			
			for(Study s : list) {
				s.setCourseLists(listStudyCourse(s.getStudyNum()));
				s.setApplyCount(headCount(s.getStudyNum()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("lecture.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<StudyCourse> listStudyCourse(int studyNum) {		
		// 스터디의 과목 리스트
		List<StudyCourse> list = null;
		
		try {
			list = dao.selectList("lecture.listStudyCourse", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int headCount(int studyNum) {
		int result = 0;
		
		try {
			result = dao.selectOne("lecture.headCount", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Study readLecture(int num) {
		Study dto = null;
		
		try {
			dto = dao.selectOne("lecture.readLecture", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertStudent(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("lecture.insertStudent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
}
