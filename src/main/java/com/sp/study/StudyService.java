package com.sp.study;

import java.util.List;
import java.util.Map;

public interface StudyService {
	public int insertStudy(Study dto, String pathname);
	public List<Study> listStudy(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Study readStudy(int num);
	public int updateStudy(Study dto, String pathname);
	public int deleteStudy(int num, String pathname);
}
