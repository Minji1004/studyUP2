package com.sp.mail;

public interface MailService {
	public int isExistSigninMail(String userEmail);
	public void insertSigninMailNum(String userEmail, String numRan);
	public void updateSigninMailNum(String userEmail, String numRan);
}
