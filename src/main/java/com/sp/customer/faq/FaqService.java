package com.sp.customer.faq;

import java.util.List;
import java.util.Map;

public interface FaqService {
	public int insertFaq(Faq dto);
	public int dataCount(Map<String, Object> map);
	public List<Faq> listFaq(Map<String, Object> map);
	public Faq readFaq(int faqNum);
	public int updateFaq(Faq dto);
	public int deleteFaq(int faqNum);
}
