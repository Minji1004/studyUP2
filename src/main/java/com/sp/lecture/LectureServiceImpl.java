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
				s.setApplyCount(headCount(s.getLectureNum()));
				System.out.println("숫자:::: "+s.getApplyCount());
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
	public int headCount(int lectureNum) {
		int result = 0;
		
		try {
			result = dao.selectOne("lecture.headCount", lectureNum);
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

	@Override
	public List<Study> myListLecture(Map<String, Object> map) {
		List<Study> list = null;
		
		try {
			list = dao.selectList("lecture.myListLecture", map);	
			
			for(Study s : list) {
				s.setCourseLists(listStudyCourse(s.getStudyNum()));
				s.setApplyCount(headCount(s.getLectureNum()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int myDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("lecture.myDataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertBasket(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("lecture.insertBasket",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
