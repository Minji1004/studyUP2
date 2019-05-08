package com.sp.mypage;

import java.util.List;
import java.util.Map;

public interface ResourceService {
	public int insertResourceGroup(Resource dto);
	public int updateResourceGroup(Resource dto);
	public int deleteResourceGroup(int groupNum);
	public Resource readResourceGroup(int groupNum);
	public List<Resource> listResourceGroup();
	
	public int insertResourceList(Resource dto);
	public int updateResourceList(Resource dto);
	public int deleteResourceList(int resourceNum);
	public Resource readResourceList(int resourceNum);
	public List<ResourceJSON> listResourceList();
	public List<Resource> listResourceList(int groupNum);
	
	public int insertResourceScheduler(Resource dto);
	public int updateResourceScheduler(Resource dto);
	public int deleteResourceScheduler(Map<String, Object> map);
	public Resource readResourceScheduler(int num);
	public List<ResourceJSON> listResourceScheduler(Map<String, Object> map);
}
