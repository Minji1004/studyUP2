package com.sp.mypage;

import java.util.List;
import java.util.Map;

import com.sp.member.Member;

public interface MypageService {

	public int updateProfile(Member dto);
	public int insertWanote(Wanote dto,String pathname);
	public int dataCount(Map<String, Object> map);
	public List<Wanote> listWanote(Map<String, Object> map);
	public Wanote readWanote(int waNum);
	public List<WanoteFileDTO> readWanoteFile(int waNum);
	public Wanote preReadWanote(Map<String, Object> map);
	public Wanote nextReadWanote(Map<String, Object> map);
	public WanoteFileDTO readWanoteFileOne(int wanoteFileNum);
	public int updateWanoteFile(WanoteFileDTO fdto);
	public int deleteWanote(int waNum);
	public int deleteWanoteFile(int waNum);
	public int insertWanoteFile(WanoteFileDTO fdto);
	public int updateWanote(Wanote dto);
	public void deleteWanoteFile(WanoteFileDTO fdto);
}
