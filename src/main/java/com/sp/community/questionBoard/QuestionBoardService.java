package com.sp.community.questionBoard;

import java.util.List;
import java.util.Map;

public interface QuestionBoardService {
	public int insertQuestionBoard(QuestionBoard dto, String mode);
	public int dataCount(Map<String, Object> map);
	public List<QuestionBoard> listQuestionBoard(Map<String, Object> map);
	
	public QuestionBoard readQuestionBoard(int questionBoardnum);
	public QuestionBoard preReadQuestionBoard(Map<String, Object> map);
	public QuestionBoard nextReadQuestionBoard(Map<String, Object> map);
	
	public int updateHitCount(int questionPostNum);
	
	public int updateQuestionBoard(QuestionBoard dto);
	public int deleteQuestionBoard(int questionPostNum);
	
}
