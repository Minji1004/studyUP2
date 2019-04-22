package com.sp.admin.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("admin.memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private CommonDAO  dao;
			
	@Override
	public Member readMember(String userId) {
		Member mdto=null;
		try {
			mdto=dao.selectOne("admin.readMember", userId);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mdto;
	}

	@Override
	public int deleteMember(String userId) {
		int result=0;
		
		try {
			result=dao.deleteData("admin.deleteMember", userId);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int memberCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("admin.memberCount", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Member> memberList(Map<String, Object> map) {
		List<Member> mList = null;
		
		try {
			mList=dao.selectList("admin.listMember", map);
		}catch (Exception e) {
			e.printStackTrace();
		}		
		
		return mList;
	}



}
