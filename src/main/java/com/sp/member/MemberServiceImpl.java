package com.sp.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private CommonDAO  dao;
	
	@Override
	public List<Member> loginMember(String userId) {
		List<Member> list=null;
		
		try {
			list = dao.selectList("member.loginMember", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public int confirmUserId(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("member.checkUserId", userId);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}

	@Override
	public int insertMember(Member dto) {
		int result = 0;
		
		try {
			dao.insertData("member.insertMember");
			int userNum = dao.selectOne("member.selectMemberNum");
			dto.setUserNum(userNum);
			if(dto.getUserId().startsWith("kakao_")) {
				result = dao.insertData("member.insertKakaoMemberInfo", dto);
			}else {
				result = dao.insertData("member.insertMemberInfo", dto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int updateMembership(Map<String, Object> map) {
		
		return 0;
	}

	@Override
	public int updateLastLogin(String userId) {
		
		return 0;
	}

	@Override
	public int updateMember(Member dto) {
		
		return 0;
	}

	@Override
	public Member readMember(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member readMember(long memberIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}



}
