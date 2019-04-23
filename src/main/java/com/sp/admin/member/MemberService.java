package com.sp.admin.member;

import java.util.List;
import java.util.Map;

public interface MemberService {	
			
	public Member readMember(int userNum);	
	public int deleteMember(String userId);	
	public int memberCount(Map<String, Object> map);
	public List<Member> memberList(Map<String, Object> map);
	
}
