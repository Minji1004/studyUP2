package com.sp.customer.notice;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("customer.noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Override
	public int insertNotice(Notice dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Notice> listNoticeTop() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Notice readNotice(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int num, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFile(Notice dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notice> listFile(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
