package com.sp.community.freeBoard;

import java.util.List;
import java.util.Map;

public interface FreeBoardService {
	public int insertFreeBoard(FreeBoard dto,String mode);
	public int dataCount(Map<String, Object> map);
	public List<FreeBoard> listFreeBoard(Map<String, Object> map);
	
	public FreeBoard readFreeBoard(int freeBoardnum);
	
	public FreeBoard preReadFreeBoard(Map<String, Object> map);
	public FreeBoard nextReadFreeBoard(Map<String, Object> map);
	
	public int updateHitCount(int freeBoardnum);
	
	public int updateFreeBoard(FreeBoard dto);
	public int deleteFreeBoard(int freeBoardnum);
}
