package com.sp.teacher;

import java.util.List;
import java.util.Map;

public interface TeacherService {
	public Teacher readTeacher(String userId) throws Exception;
	public List<Map<String, String>> readSubject(String userId) throws Exception;
	public void updateIntroduce(Teacher dto) throws Exception;
	
}
