package com.sp.teacher.notice;

import java.util.List;
import java.util.Map;

import com.sp.common.MyFile;

public interface TeacherNoticeService {

	public void insertNotice(TeacherNotice dto, String pathname) throws Exception;
	public int insertFile(TeacherNotice dto);
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<TeacherNotice> listTNotice(Map<String, Object> map) throws Exception;
	public List<TeacherNotice> listNoticeTop() throws Exception;
	
	public TeacherNotice readTeacherNotice(int tnoticeNum) throws Exception;
	public void updateHitCount(int tnoticeNum) throws Exception;
	public List<MyFile> listFile(int tnoticeNum) throws Exception;
	
	//이전 다음 파일 가져오기
	public TeacherNotice preReadTNotice(Map<String, Object> map) throws Exception;
	public TeacherNotice nextReadTNotice(Map<String, Object> map) throws Exception;
	
	//Like 읽기
	public int checkUserLikeNum(Map<String, Object> map) throws Exception;
	public int likeNumCount(int tnoticeNum) throws Exception;
	public int updateLikeNum(Map<String, Object> map) throws Exception;
	public TeacherNotice readFile(int fileNum) throws Exception;
}
