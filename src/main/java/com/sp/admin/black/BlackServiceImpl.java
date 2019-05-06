package com.sp.admin.black;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("admin.black.blackService")
public class BlackServiceImpl implements BlackService{
	
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertBlack(Black bdto) throws Exception {
		try {
			dao.insertData("admin.insertBlack", bdto);
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	@Override
	public int dataBlackCount(Map<String, Object> map) throws Exception {
		int result=0;
		
		try {
			result=dao.selectOne("admin.dataBlackCount", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
				
		return result;
	}

	@Override
	public List<Black> listBlack(Map<String, Object> map) throws Exception {
		List<Black> blist = null;
		
		try {
			blist=dao.selectList("admin.listBlack", map);			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return blist;
	}

	@Override
	public void updateBlack(String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}
