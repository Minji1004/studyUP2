package com.sp.mypage;

import java.io.File;
import java.util.List;

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

}
