package com.sp.member;

import java.util.List;
import java.util.Map;

public interface RegisterService {

	public List<Bank> selectBank();
	public int insertRegister(Map<String, Object> map);
}
