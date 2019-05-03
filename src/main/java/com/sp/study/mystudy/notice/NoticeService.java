package com.sp.study.mystudy.notice;

import java.util.List;
import java.util.Map;

import com.sp.common.MyFile;

public interface NoticeService {
	public int insertNotice(Notice dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop(Map<String, Object> map);
	public int updateHitCount(int sNoticeNum);
	public Notice readNotice(int sNoticeNum);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	public int updateNotice(Notice dto, String pathname);
	public int deleteNotice(int sNoticeNum, String pathname);
	
	public int insertFile(Notice dto);
	public List<MyFile> listFile(int sNoticeNum);
	public Notice readFile(int snFileNum);
	public int deleteFile(Map<String, Object> map);
}
