package com.sp.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("member.registerService")
public class RegisterServiceImpl implements RegisterService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Bank> selectBank() {
		
		List<Bank> list = null;
		
		try {
			list=dao.selectList("register.bankList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int insertRegister(Map<String, Object> map) {
		
		int result = 0;
		
		try {
			result=dao.insertData("register.blicense", map);
			result=dao.insertData("register.account", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
		return result;
	}

}
