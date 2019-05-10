package com.sp.community.worryBoard;

import java.util.List;
import java.util.Map;

public interface WorryBoardService {
	public int insertWorryBoard(WorryBoard dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<WorryBoard> listWorryBoard(Map<String, Object> map);
	public List<WorryBoard> listWorryBoardTop();
	public int updateHitCount(int num);
	public WorryBoard readWorryBoard(int num);
	public WorryBoard preReadWorryBoard(Map<String, Object> map);
	public WorryBoard nextReadWorryBoard(Map<String, Object> map);
	public int updateWorryBoard(WorryBoard dto, String pathname);
	public int deleteWorryBoard(int num, String pathname);
	
	public int insertFile(WorryBoard dto);
	public List<WorryBoard> listFile(int num);
	public WorryBoard readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
}
