package com.sp.customer.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public int insertNotice(Notice dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public List<Notice> listNoticeTop();
	public int updateHitCount(int noticeNum);
	public Notice readNotice(int noticeNum);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	public int updateNotice(Notice dto, String pathname);
	public int deleteNotice(int noticeNum, String pathname);
	
	public int insertFile(Notice dto);
	public List<Notice> listFile(int noticeNum);
	public Notice readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
}
