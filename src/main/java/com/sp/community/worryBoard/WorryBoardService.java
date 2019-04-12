package com.sp.community.worryBoard;

import java.util.List;
import java.util.Map;

public interface WorryBoardService {
	public int insertWorBoard(WorryBoard dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<WorryBoard> listWorBoard(Map<String, Object> map);
	public List<WorryBoard> listWorBoardTop();
	public int updateHitCount(int num);
	public WorryBoard readWorBoard(int num);
	public WorryBoard preReadWorBoard(Map<String, Object> map);
	public WorryBoard nextReadWorBoard(Map<String, Object> map);
	public int updateWorBoard(WorryBoard dto, String pathname);
	public int deleteWorBoard(int num, String pathname);
	
	public int insertFile(WorryBoard dto);
	public List<WorryBoard> listFile(int num);
	public WorryBoard readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
}
