package com.sp.community.worryBoard;

import java.util.List;
import java.util.Map;

public interface WorryBoardService {
	public int insertWorryBoard(WorryBoard dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<WorryBoard> listWorryBoard(Map<String, Object> map);
	public List<WorryBoard> listWorryBoardTop();
	public int updateHitCount(int worryBoardnum);
	public WorryBoard readWorryBoard(int num);
	public WorryBoard preReadworryBoard(Map<String, Object> map);
	public WorryBoard nextReadworryBoard(Map<String, Object> map);
	public int updateWorryBoard(WorryBoard dto, String pathname);
	public int deleteWorryBoard(int worryBoardnum, String pathname);
	
	public int insertFile(WorryBoard dto);
	public List<WorryBoard> listFile(int worryBoardnum);
	public WorryBoard readFile(int fileNum);
	public int deleteFile1(int worryBoardnum);
	public int deleteFile2(int fileNum);
}
