package com.sp.mypage;

import java.util.List;

import com.sp.member.Member;

public interface MypageService {

	public int updateProfile(Member dto);
	
	public int insertWanote(WanoteDTO dto,List<WanoteFileDTO> flist);
}
