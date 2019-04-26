package com.sp.customer.inquiry;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("customer.inquiryService")
public class InquiryServiceImpl implements InquiryService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertInquiry(Inquiry dto, String mode) {
		int result=0;
		
		try {
			int maxNum=dao.selectOne("inquiry.maxinquiryNum");
			int inquiryNum=maxNum+1;
			dto.setInquiryNum(inquiryNum);
			
			dao.insertData("inquiry.insertInquiry",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("inquiry.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Inquiry> listInquiry(Map<String, Object> map) {
		List<Inquiry> list=null;
		
		try {
			list=dao.selectList("inquiry.listInquiry", map);
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		return list;
	}

	@Override
	public List<Inquiry> relationInquiry(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Inquiry readInquiry(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateInquiryState(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateInquiry(Inquiry dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteInquiry(int num) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
