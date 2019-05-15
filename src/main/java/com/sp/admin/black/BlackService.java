package com.sp.admin.black;

import java.util.List;
import java.util.Map;

public interface BlackService {
	public void insertBlack(Black bdto) throws Exception;
	public int dataBlackCount(Map<String, Object> map) throws Exception;
	public List<Black> listBlack(Map<String, Object> map) throws Exception;
	public void updateBlack(int blackNum) throws Exception;
	public Black readBlack(int num) throws Exception;
		
}
