package com.sp.study.mystudy.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("snotice.noticeService")
public class NoticeServiceImpl implements NoticeService{	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	

	@Override
	public int insertNotice(Notice dto, String pathname) {
		int result = 0;
		
		try {
			int seq = dao.selectOne("snotice.maxSnoticeNum");
			seq += 1;
			dto.setsNoticeNum(seq);
			
			result = dao.insertData("snotice.insertSnotice", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf : dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					
					if(saveFilename != null) {
						String originalFilename = mf.getOriginalFilename();
						long fileSize = mf.getSize();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						dto.setFileSize(fileSize);
						
						insertFile(dto);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("snotice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		
		List<Notice> list = null;
		
		try {
			list = dao.selectList("snotice.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("snotice.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public int updateHitCount(int sNoticeNum) {
		int result = 0;
		
		try {
			dao.updateData("snotice.updateHitCount", sNoticeNum);
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}

	@Override
	public Notice readNotice(int sNoticeNum) {
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
		int result = 0;
		
		try {
			result = dao.insertData("snotice.insertFile", dto); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Notice> listFile(int sNoticeNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice readFile(int snFileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
