package com.sp.teacher;

import java.util.List;
import java.util.Map;

public interface TeacherService {
	public Teacher readTeacher(int tnum) throws Exception;
	public List<Map<String, String>> readSubject(String userId) throws Exception;
	public void updateIntroduce(Teacher dto) throws Exception;
	public void insertIntroduce(Teacher dto) throws Exception;
	
	public List<Work> readWork(int tnum) throws Exception;
	public void insertWork(Work dto) throws Exception;
	public int readLastWorkNum(int tnum) throws Exception;
	public void deleteWork(int num) throws Exception;
}
