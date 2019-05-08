package com.sp.teacher.notice;

import java.util.List;
import java.util.Map;

import com.sp.common.MyFile;

public interface TeacherNoticeService {

	public void insertNotice(TeacherNotice dto, String pathname) throws Exception;
	public int insertFile(TeacherNotice dto);
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<TeacherNotice> listTNotice(Map<String, Object> map) throws Exception;
	public List<TeacherNotice> listNoticeTop(Map<String, Object> map) throws Exception;
	public void updateNotice(TeacherNotice dto, String pathname) throws Exception;
	
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
	public void deleteLikeNum(int tnoticeNum) throws Exception;
	
	//파일
	public MyFile readFile(int fileNum) throws Exception;
	public void deleteFile(int fileNum) throws Exception;
	public void deleteAllFile(int tnoticeNum) throws Exception;
	
	//댓글
	public void insertReply(Reply dto) throws Exception;
	public int replyCount(Map<String, Object> map) throws Exception;
	public List<Reply> listReply(Map<String, Object> map) throws Exception;
	public void insertReplyAnswer(Reply dto) throws Exception;
	public List<Reply> listAnswerReply(int tnotice_r_num) throws Exception;
	public void deleteReply(int tnotice_r_num) throws Exception;
	public int answerCount(int tnotice_r_num)throws Exception;
	public void updateReply(Reply dto) throws Exception;
	public void deleteAllReply(int tnoticeNum) throws Exception;
	
	public void deleteNotice(int tnoticeNum) throws Exception;
}
