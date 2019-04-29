package com.sp.mypage;

import com.sp.member.Member;

public interface MypageService {

	public int updateProfile(Member dto);
	public int insertWanote(Wanote dto,String pathname);
}
