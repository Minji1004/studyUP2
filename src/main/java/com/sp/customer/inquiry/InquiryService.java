package com.sp.customer.inquiry;

import java.util.List;
import java.util.Map;

public interface InquiryService {
	public int insertInquiry(Inquiry dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<Inquiry> listInquiry(Map<String, Object> map);
	public List<Inquiry> relationInquiry(int InquiryNum);
	public Inquiry readInquiry(int InquiryNum);
	public int updateInquiryState(Map<String, Object> map);
	public int updateInquiry(Inquiry dto, String pathname);
	public int deleteInquiry(int num, String pathname);
	
	public int insertFile(Inquiry dto);
	public List<Inquiry> listFile(int inquiryNum);
	public Inquiry readFile(int fileNum);
	public int deleteFile1(int inquiryNum);
	public int deleteFile2(int fileNum);
}
