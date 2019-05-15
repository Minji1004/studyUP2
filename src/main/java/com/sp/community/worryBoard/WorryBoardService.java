package com.sp.community.worryBoard;

import java.util.List;
import java.util.Map;

public interface WorryBoardService {
	public int insertWorryBoard(WorryBoard dto, String mode);
	public int dataCount(Map<String, Object> map);
	
	public List<WorryBoard> listWorryBoard(Map<String, Object> map);
	
	public WorryBoard readWorryBoard(int worryPostnum);
	
	public WorryBoard preReadWorryBoard(Map<String, Object> map);
	public WorryBoard nextReadWorryBoard(Map<String, Object> map);
	
	public int updateHitCount(int worryPostnum);

	public int updateWorryBoard(WorryBoard dto);
	public int deleteWorryBoard(int worryPostnum);
}
