package com.sp.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("scheduler.resourceService")
public class ResourceServiceImpl implements ResourceService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertResourceGroup(Resource dto) {
		int result=0;
		try {
			result=dao.insertData("scheduler.insertResourceGroup", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateResourceGroup(Resource dto) {
		int result=0;
		try {
			result=dao.updateData("scheduler.updateResourceGroup", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteResourceGroup(int groupNum) {
		int result=0;
		try {
			result=dao.deleteData("scheduler.deleteResourceGroup", groupNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Resource readResourceGroup(int groupNum) {
		Resource dto=null;
		try{
			dto=dao.selectOne("scheduler.readResourceGroup", groupNum);
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	@Override
	public List<Resource> listResourceGroup() {
		List<Resource> list=null;
		try {
			list=dao.selectList("scheduler.listResourceGroup");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertResourceList(Resource dto) {
		int result=0;
		try {
			result=dao.insertData("scheduler.insertResourceList", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateResourceList(Resource dto) {
		int result=0;
		try {
			result=dao.updateData("scheduler.updateResourceList", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteResourceList(int resourceNum) {
		int result=0;
		try {
			result=dao.deleteData("scheduler.deleteResourceList", resourceNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Resource readResourceList(int resourceNum) {
		Resource dto=null;
		try{
			dto=dao.selectOne("scheduler.readResourceList", resourceNum);
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	@Override
	public List<ResourceJSON> listResourceList() {
		List<ResourceJSON> list=null;
		try {
			list=dao.selectList("scheduler.listResourceList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Resource> listResourceList(int groupNum) {
		List<Resource> list=null;
		try {
			list=dao.selectList("scheduler.listResourceList2", groupNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public int insertResourceScheduler(Resource dto) {
		int result=0;
		try {
			result=dao.insertData("scheduler.insertResourceScheduler", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateResourceScheduler(Resource dto) {
		int result=0;
		try {
			result=dao.updateData("scheduler.updateResourceScheduler", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteResourceScheduler(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("scheduler.deleteResourceScheduler", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Resource readResourceScheduler(int num) {
		Resource dto=null;
		try{
			dto=dao.selectOne("scheduler.readResourceScheduler", num);
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public List<ResourceJSON> listResourceScheduler(Map<String, Object> map) {
		List<ResourceJSON> list=null;
		try {
			list=dao.selectList("scheduler.listResourceScheduler", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
}
