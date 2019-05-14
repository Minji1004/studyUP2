package com.sp.community.questionBoard;

import java.util.List;
import java.util.Map;

public interface QuestionBoardService {
	public int insertQuestionBoard(QuestionBoard dto, String mode);
	public int dataCount(Map<String, Object> map);
	public List<QuestionBoard> listQuestionBoard(Map<String, Object> map);
	
	public int updateHitCount(int questionPostnum);
	public QuestionBoard readQuestionBoard(int questionPostnum);
	public QuestionBoard preReadQuestionBoard(Map<String, Object> map);
	public QuestionBoard nextReadQuestionBoard(Map<String, Object> map);
	public int updateQuestionBoard(QuestionBoard dto);
	public int deleteQuestionBoard(int questionPostnum);
	
}
