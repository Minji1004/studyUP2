package com.sp.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("study.categoryService")
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Category> listCategory() {
		List<Category> list = null;
		
		try {
			list = dao.selectList("study.listCategory");			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Category> listCourse(int categoryNum) {
		List<Category> list = null;
		
		try {
			list = dao.selectList("study.listCourse", categoryNum);			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

}
