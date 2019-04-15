package com.sp.customer.inquiry;

import java.util.List;
import java.util.Map;

public interface InquiryService {
	public int insertInquiry(Inquiry dto, String mode);
	public int dataCount(Map<String, Object> map);
	
	public List<Inquiry> listInquiry(Map<String, Object> map);
	
	public List<Inquiry> relationInquiry(int num);
	public Inquiry readInquiry(int num);
	
	public int updateInquiryState(Map<String, Object> map);
	public int updateInquiry(Inquiry dto);
	public int deleteInquiry(int num);
}
