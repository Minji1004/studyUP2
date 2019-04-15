package com.sp.customer.inquiry;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("customer.inquiryService")
public class InquiryServiceImpl implements InquiryService {

	
	@Override
	public int insertInquiry(Inquiry dto, String mode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Inquiry> listInquiry(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
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
