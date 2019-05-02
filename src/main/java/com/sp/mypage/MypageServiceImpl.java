package com.sp.mypage;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;
import com.sp.member.Member;

@Service("mypage.mypageService")
public class MypageServiceImpl implements MypageService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int updateProfile(Member dto) {
		int result = 0;
		try {
			
			result = dao.updateData("mypage.updateProfile", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int insertWanote(Wanote dto, String pathname) {
		int result = 0;
		
		try {
			result = dao.insertData("mypage.insertWanote", dto);
			int waNum = dao.selectOne("mypage.selectMaxWanoteNum");
			WanoteFileDTO fdto = null;
			String saveFilename = null;
			for(MultipartFile mfile : dto.getUpload()) {
				if(mfile.isEmpty())
					continue;
				fdto = new WanoteFileDTO();
				fdto.setWaNum(waNum);
				
				saveFilename = fileManager.doFileUpload(mfile, pathname);
				if(saveFilename!=null){
					String originalFilename = mfile.getOriginalFilename();
					fdto.setOriginalFilename(originalFilename);
				}
				
				fdto.setSaveFilename(saveFilename);
				
				dao.insertData("mypage.insertWanoteFile", fdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
			
			
		
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.selectOne("mypage.dataCount", map);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Wanote> listWanote(Map<String, Object> map) {
		List<Wanote> list = null;
		
		try {
			list=dao.selectList("mypage.listWanote", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Wanote readWanote(int waNum) {
		Wanote dto = null;
		
		try {
			//게시물 가져오기 
			dto = dao.selectOne("mypage.readWanote", waNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<WanoteFileDTO> readWanoteFile(int waNum) {
		List<WanoteFileDTO>  flist = null;
		
		try {
			//게시물 파일 가져오기
			flist = dao.selectList("mypage.readWanoteFile", waNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flist;
	}

	@Override
	public Wanote preReadWanote(Map<String, Object> map) {
		Wanote dto = null;
		
		try {
			dto = dao.selectOne("mypage.preReadWanote", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Wanote nextReadWanote(Map<String, Object> map) {
		Wanote dto = null;
		
		try {
			dto = dao.selectOne("mypage.nextReadWanote", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public WanoteFileDTO readWanoteFileOne(int wanoteFileNum) {
		WanoteFileDTO dto = null;
		
		try {
			dto = dao.selectOne("mypage.readWanoteFileOne", wanoteFileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	


}
