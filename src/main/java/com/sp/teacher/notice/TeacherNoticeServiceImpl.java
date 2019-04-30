package com.sp.teacher.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.MyFile;
import com.sp.common.dao.CommonDAO;

@Service("teacher.notice.teacherNoticeService")
public class TeacherNoticeServiceImpl implements TeacherNoticeService{

	@Autowired
	CommonDAO dao;
	
	@Autowired
	FileManager fileManager;
	
	@Override
	public void insertNotice(TeacherNotice dto, String pathname) throws Exception {
				
		try {			
			int maxNum = dao.selectOne("tnotice.maxNoticeNum");
			int tnoticeNum = maxNum+1;
			dto.setTnoticeNum(tnoticeNum);
			
			dao.insertData("tnotice.insertNotice", dto);
			
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
			// TODO: handle exception
		}
	
	}
	
	@Override
	public int insertFile(TeacherNotice dto) {
		int result=0;
		try {
			result=dao.insertData("tnotice.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result =0;
		
		try {
			result = dao.selectOne("tnotice.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<TeacherNotice> listTNotice(Map<String, Object> map) throws Exception {
		
		List<TeacherNotice> list = null;
		
		try {
			list = dao.selectList("tnotice.listTNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<TeacherNotice> listNoticeTop() throws Exception {
		List<TeacherNotice> list = null;
		
		try {
			list = dao.selectList("tnotice.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public TeacherNotice readTeacherNotice(int tnoticeNum) throws Exception {
		
		TeacherNotice teacherNotice = null;
		
		try {
			teacherNotice = dao.selectOne("tnotice.readTeacherNotice", tnoticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return teacherNotice;
	}

	@Override
	public void updateHitCount(int tnoticeNum) throws Exception {
		
		try {
			dao.updateData("tnotice.updateHitCount", tnoticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<MyFile> listFile(int tnoticeNum) throws Exception {
		
		List<MyFile> listFile = null;
		
		try {
			listFile = dao.selectList("tnotice.selectListFile", tnoticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	@Override
	public TeacherNotice preReadTNotice(Map<String, Object> map) throws Exception {
		
		TeacherNotice teacherNotice = null;
		try {
			teacherNotice = dao.selectOne("tnotice.preReadTNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return teacherNotice;
	}

	@Override
	public TeacherNotice nextReadTNotice(Map<String, Object> map) throws Exception {
		TeacherNotice teacherNotice = null;
		try {
			teacherNotice = dao.selectOne("tnotice.nextReadTNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return teacherNotice;
	}

	@Override
	public int checkUserLikeNum(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("tnotice.checkUserLikeNum", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int likeNumCount(int tnoticeNum) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("tnotice.likeNumCount", tnoticeNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateLikeNum(Map<String, Object> map) throws Exception {
		
		try {
			
			try {
				dao.deleteData("tnotice.insertUserLikeNum", map);
			} catch (Exception e) {
				dao.deleteData("tnotice.deleteUserLikeNum", map);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public TeacherNotice readFile(int fileNum) throws Exception {
		
		TeacherNotice result = null;
		
		try {
			result = dao.selectOne("tnotice.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}	
}