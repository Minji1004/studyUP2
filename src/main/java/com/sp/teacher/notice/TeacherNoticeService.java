package com.sp.teacher.notice;

import java.util.List;
import java.util.Map;

public interface TeacherNoticeService {

	public void insertNotice(TeacherNotice dto, String pathname) throws Exception;
	public int insertFile(TeacherNotice dto);
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<TeacherNotice> listTNotice(Map<String, Object> map) throws Exception;
	public List<TeacherNotice> listNoticeTop() throws Exception;
}
