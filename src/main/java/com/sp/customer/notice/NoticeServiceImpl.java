package com.sp.customer.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("customer.noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertNotice(Notice dto, String pathname) {
		int result=0;
		
		try {
			int maxNum=dao.selectOne("notice.maxNoticeNum");
			int noticeNum=maxNum+1;
			dto.setNoticeNum(noticeNum);
			
			dao.insertData("notice.insertNotice",dto);
			
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list=null;
		
		try {
			list=dao.selectList("notice.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list=null;
		
		try {
			list=dao.selectList("notice.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updateHitCount(int noticeNum) {
		int result=0;
		
		try {
			result=dao.updateData("notice.updateHitCount", noticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Notice readNotice(int noticeNum) {
		Notice dto=null;
		
		try {
			dto=dao.selectOne("notice.readNotice", noticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto=null;
		
		try {
			dto=dao.selectOne("notice.preReadNotice",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto=null;
		
		try {
			dto=dao.selectOne("notice.nextReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) {
		int result=0;
		
		try {
			result=dao.updateData("notice.updateNotice", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
						String originalFilename=mf.getOriginalFilename();
						long fileSize=mf.getSize();
						
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
	public int deleteNotice(int noticeNum, String pathname) {
		int result=0;
		try {
			result=dao.deleteData("notice.deleteNotice", noticeNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int insertFile(Notice dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notice> listFile(int noticeNum) {
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
