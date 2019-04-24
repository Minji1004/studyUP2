package com.sp.customer.faq;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("customer.faqService")
public class FaqServiceImpl implements FaqService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertFaq(Faq dto) {
		int result=0;
		
			try {
				
				dao.insertData("faq.insertFaq", dto);
				
				result=1;
				
			} catch (Exception e) {
				e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
			try {
				result=dao.selectOne("faq.dataCount", map);
			} catch (Exception e) {
				e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list=null;
		
			try {
				list=dao.selectList("faq.listFaq", map);
			} catch (Exception e) {
				e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int updateHitCount(int faqNum) {
		int result=0;
		
			try {
				result=dao.updateData("faq.updateHitCount", faqNum);
			} catch (Exception e) {
				e.printStackTrace();
		}
		return result;
	}

	@Override
	public Faq readFaq(int faqNum) {
		Faq dto=null;
		
			try {
				dto=dao.selectOne("faq.readFaq", faqNum);
			} catch (Exception e) {
				e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Faq preReadFaq(Map<String, Object> map) {
		Faq dto=null;
		
			try {
				dto=dao.selectOne("faq.preReadFaq", map);
			} catch (Exception e) {
				e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Faq nextReadFaq(Map<String, Object> map) {
		Faq dto=null;
		
			try {
				dto=dao.selectOne("faq.nextReadFaq", map);
			} catch (Exception e) {
				e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateFaq(Faq dto) {
		int result=0;
		
			try {
				result=dao.updateData("faq.updateFaq", dto);
			} catch (Exception e) {
				e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteFaq(int faqNum) {
		int result=0;
		try {
			result=dao.deleteData("faq.deleteFaq", faqNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Faq> listFaqTop() {
		// TODO Auto-generated method stub
		return null;
	}

}
