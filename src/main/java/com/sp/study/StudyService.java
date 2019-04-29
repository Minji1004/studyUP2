package com.sp.study;

import java.util.List;
import java.util.Map;

public interface StudyService {
	// 스터디
	public int insertStudy(Study dto, String pathname);
	public List<Study> listStudy(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Study readStudy(int studyNum);
	public int updateStudy(Study dto, String pathname);
	public int deleteStudy(int studyNum, String studyImg, String pathname);
	
	// 스터디의 과목
	public List<StudyCourse> listStudyCourse(int studyNum);
	
	// 스터디의 가입된 인원
	public int headCount(int studyNum);
	
}
