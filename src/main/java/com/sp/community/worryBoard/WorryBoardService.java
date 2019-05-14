package com.sp.community.worryBoard;

import java.util.List;
import java.util.Map;

public interface WorryBoardService {
	public int insertWorryBoard(WorryBoard dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<WorryBoard> listWorryBoard(Map<String, Object> map);
	public List<WorryBoard> listWorryBoardTop();
	public int updateHitCount(int worryPostnum);
	public WorryBoard readWorryBoard(int worryPostnum);
	public WorryBoard preReadworryBoard(Map<String, Object> map);
	public WorryBoard nextReadworryBoard(Map<String, Object> map);
	public int updateWorryBoard(WorryBoard dto, String pathname);
	public int deleteWorryBoard(int worryPostnum, String pathname);
	
	public int insertFile(WorryBoard dto);
	public List<WorryBoard> listFile(int worryPostnum);
	public WorryBoard readFile(int fileNum);
	public int deleteFile1(int worryPostnum);
	public int deleteFile2(int fileNum);
}
