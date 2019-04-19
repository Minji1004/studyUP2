package com.sp.teacher;

import java.util.List;
import java.util.Map;

public interface CommentService {
	public void insertComment(Comment dto) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Comment> listComment(Map<String, Object> map) throws Exception;
}
