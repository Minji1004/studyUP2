package com.sp.teacher;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("teacher.commentService")
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommonDAO dao;
	
	@Override
	public void insertComment(Comment dto) throws Exception {		
		try {
			dao.insertData("comment.insertComment", dto);
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}			
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result=0;
		
		try {
			result = dao.selectOne("comment.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
			
			throw e;
		}
		
		return result;
	}

	@Override
	public List<Comment> listComment(Map<String, Object> map) throws Exception {
		List<Comment> list = new ArrayList<>();
		
		try {
			list = dao.selectList("comment.listComment", map);
		} catch (Exception e) {
			e.printStackTrace();			
			throw e;
		}
		
		return list;
	}

	@Override
	public void deleteComment(int num) throws Exception {
		try {
			dao.deleteData("comment.deleteComment", num);
		} catch (Exception e) {
			e.printStackTrace();			
			throw e;
		}
		
	}
	

}
