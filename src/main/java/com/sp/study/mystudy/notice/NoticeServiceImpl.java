package com.sp.study.mystudy.notice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.MyFile;
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
	public List<Notice> listNoticeTop(Map<String, Object> map) {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("snotice.listNoticeTop", map);
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
		Notice notice = null;
		
		try {
			notice = dao.selectOne("snotice.readNotice", sNoticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return notice;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice notice = null;
		
		try {
			notice = dao.selectOne("snotice.preReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return notice;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice notice = null;
		
		try {
			notice = dao.selectOne("snotice.nextReadNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return notice;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) {
		int result = 0;
		
		try {
			result=dao.updateData("snotice.updateNotice", dto);
			
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
	public int deleteNotice(int sNoticeNum, String pathname) {
		int result = 0;
		
		try {
			// 파일 지우기
			List<MyFile> listFile=listFile(sNoticeNum);
			if(listFile!=null) {
				Iterator<MyFile> it=listFile.iterator();
				while(it.hasNext()) {
					MyFile dto=it.next();
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			// 파일 테이블 내용 지우기
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("field", "sNoticeNum");
			map.put("sNoticeNum", sNoticeNum);
			deleteFile(map);
			
			result=dao.deleteData("snotice.deleteNotice", sNoticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
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
	public List<MyFile> listFile(int sNoticeNum) {
		List<MyFile> listFile=null;
		
		try {
			listFile=dao.selectList("snotice.fileList", sNoticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	@Override
	public Notice readFile(int snFileNum) {
		Notice dto=null;
		
		try {
			dto=dao.selectOne("notice.readFile", snFileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.deleteData("snotice.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
