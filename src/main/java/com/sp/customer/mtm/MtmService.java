package com.sp.customer.mtm;

import java.util.List;
import java.util.Map;

public interface MtmService {
	public int insertInquiry(Mtm dto, String mode);
	public int dataCount(Map<String, Object> map);
	
	public List<Mtm> listInquiry(Map<String, Object> map);
	
	public List<Mtm> relationInquiry(int num);
	public Mtm readInquiry(int num);
	
	public int updateInquiryState(Map<String, Object> map);
	public int updateInquiry(Mtm dto);
	public int deleteInquiry(int num);
}
