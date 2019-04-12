package com.sp.customer.mtm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("customer.inquiryService")
public class MtmServiceImpl implements MtmService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertInquiry(Mtm dto, String mode) {
		int result=0;
		
		try {
			if(mode.equals("reply")) {
				// 문자 또는 이메일 답변처리
				
				dto.setType(1); // 답변
				dto.setState(1);
				dto.setPhoneRecv(0);
				dto.setPhone("");
				dto.setEmailRecv(0);
				dto.setEmail("");
				
				Map<String, Object> map=new HashMap<>();
				map.put("num", dto.getParent());
				map.put("state", "1");
				updateInquiryState(map);
			} else {
				dto.setType(0); // 질문
			}
			
			result=dao.insertData("inquiry.insertInquiry", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("inquiry.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Mtm> listInquiry(Map<String, Object> map) {
		List<Mtm> list=null;
		
		try {
			list=dao.selectList("inquiry.listInquiry", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Mtm> relationInquiry(int num) {
		List<Mtm> list=null;
		
		try {
			list=dao.selectList("inquiry.relationInquiry", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int updateInquiryState(Map<String, Object> map) {
		int result=0;

		try{
			result=dao.updateData("inquiry.updateInquiryState", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public Mtm readInquiry(int num) {
		Mtm dto=null;
		
		try{
			dto=dao.selectOne("inquiry.readInquiry", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateInquiry(Mtm dto) {
		int result=0;

		try{
			result=dao.updateData("inquiry.updateInquiry", dto);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteInquiry(int num) {
		int result=0;

		try{
			result=dao.deleteData("inquiry.deleteInquiry", num);
		} catch(Exception e) {
		}
		return result;
	}
}
