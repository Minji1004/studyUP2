package com.sp.community.questionBoard;

import java.util.List;
import java.util.Map;

public interface QuestionBoardService {
	public int insertQuestionBoard(QuestionBoard dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<QuestionBoard> listQuestionBoard(Map<String, Object> map);
	public List<QuestionBoard> listQuestionBoardTop();
	public int updateHitCount(int questionPostnum);
	public QuestionBoard readQuestionBoard(int questionPostnum);
	public QuestionBoard preReadQuestionBoard(Map<String, Object> map);
	public QuestionBoard nextReadQuestionBoard(Map<String, Object> map);
	public int updateQuestionBoard(QuestionBoard dto, String pathname);
	public int deleteQuestionBoard(int questionPostnum, String pathname);
	
	public int insertFile(QuestionBoard dto);
	public List<QuestionBoard> listFile(int questionPostnum);
	public QuestionBoard readFile(int fileNum);
	public int deleteFile1(int questionPostnum);
	public int deleteFile2(int fileNum);
}
