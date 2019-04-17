package com.sp.study;

import java.util.List;
import java.util.Map;

public interface ApplyStudyService {	
	// 스터디 가입 신청
	public int applyStudy(ApplyStudy dto);
	public List<ApplyStudy> listApplyStudy(Map<String, Object> map);
	public ApplyStudy readApplyStudy(int applyNum);
	public int applyStudyCount(Map<String, Object> map);
	public int updateApplyStudy(ApplyStudy dto);

}
