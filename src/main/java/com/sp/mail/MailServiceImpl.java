package com.sp.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("mail.mailService")
public class MailServiceImpl implements MailService{
	@Autowired
	private CommonDAO  dao;
	
	@Override
	public int isExistSigninMail(String userEmail) {
		int result = 0;
		
		try {
			result = dao.selectOne("member.isExistSigninMail", userEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertSigninMailNum(String userEmail, String numRan) {
		try {
			MailConfirmDTO dto = new MailConfirmDTO();
			dto.setNumRan(numRan);
			dto.setUserEmail(userEmail);
			dao.insertData("member.insertSigninMailNum", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateSigninMailNum(String userEmail, String numRan) {
		try {
			MailConfirmDTO dto = new MailConfirmDTO();
			dto.setNumRan(numRan);
			dto.setUserEmail(userEmail);
			dao.updateData("member.updateSigninMailNum", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	
}
