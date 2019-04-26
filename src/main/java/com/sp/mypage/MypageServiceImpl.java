package com.sp.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.member.Member;

@Service("mypage.mypageService")
public class MypageServiceImpl implements MypageService{
	@Autowired
	private CommonDAO dao;
	
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

}
