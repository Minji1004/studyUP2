package com.sp.admin.black;

import java.util.List;
import java.util.Map;

public interface BlackService {
	public void insertBlack(Black dto) throws Exception;
	public int dataBlackCount() throws Exception;
	public List<Black> listBlack(Map<String, Object> map) throws Exception;
	public void updateBlack(String userId) throws Exception;
	public void deleteBlack(String userId) throws Exception;
	
}
