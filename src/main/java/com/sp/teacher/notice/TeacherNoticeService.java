package com.sp.teacher.notice;

public interface TeacherNoticeService {

	public void insertNotice(TeacherNotice dto, String pathname) throws Exception;
	public int insertFile(TeacherNotice dto);
}
