package com.sp.lecture;

import java.util.List;
import java.util.Map;

import com.sp.study.Study;
import com.sp.study.StudyCourse;

public interface LectureService {

	public List<Study> listStudy(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public List<StudyCourse> listStudyCourse(int studyNum);
	public int headCount(int studyNum);
	public Study readLecture(int studyNum);
	
	public void insertStudent(Map<String, Object> map) throws Exception;
	public List<Study> myListLecture(Map<String, Object> map);
	public int myDataCount(Map<String, Object> map);
	
	public void insertBasket(Map<String, Object> map) throws Exception;
	
}
