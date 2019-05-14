package com.sp.community.questionBoard;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("questionBoard.questionboardService")
public class QuestionBoardServiceImpl implements QuestionBoardService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertQuestionBoard(QuestionBoard dto, String pathname) {
		int result=0;
		
		try {
			int maxNum=dao.selectOne("questionBoard.qusetionPostnum");
			dto.setQuestionPostnum(maxNum+1);
			
			result=dao.insertData("questionBoard.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("questionBoard.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public List<QuestionBoard> listQuestionBoard(Map<String, Object> map) {
		List<QuestionBoard> list=null;
		
		try {
			list=dao.selectList("questionBoard.listQusetionBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<QuestionBoard> listQuestionBoardTop() {
		List<QuestionBoard> list=null;
		
		try {
			list=dao.selectList("questionBoard.listquestionBoardTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int updateHitCount(int questionPostnum) {
		int result=0;
		
		try {
			result=dao.updateData("questionBoard.updateHitCount", questionPostnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public QuestionBoard readQuestionBoard(int questionPostnum) {
		QuestionBoard dto=null;
		
		try {
			dto=dao.selectOne("questionBoard.readquestionBoard", questionPostnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public QuestionBoard preReadQuestionBoard(Map<String, Object> map) {
		QuestionBoard dto=null;
		
		try {
			dto=dao.selectOne("questionBoard.preReadquetionBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public QuestionBoard nextReadQuestionBoard(Map<String, Object> map) {
		QuestionBoard dto=null;
		
		try {
			dto=dao.selectOne("questionBoard.preReadquestionBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return dto;
	}
	@Override
	public int updateQuestionBoard(QuestionBoard dto, String pathname) {
		int result=0;
		
		try {
			result=dao.updateData("questionBoard.updatequestionBoard", dto);
			
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
						String originalFilename=mf.getOriginalFilename();
						long fileSize=mf.getSize();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						dto.setFileSize(fileSize);
						
						insertFile(dto);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int deleteQuestionBoard(int questionPostnum, String pathname) {
		int result=0;
		try {
			List<QuestionBoard> listFile=listFile(questionPostnum);
			if(listFile!=null) {
				Iterator<QuestionBoard> it=listFile.iterator();
				while(it.hasNext()) {
					QuestionBoard dto=it.next();
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			deleteFile1(questionPostnum);
			
			result=dao.deleteData("questionBoard.deleteQuestionBoard", questionPostnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int insertFile(QuestionBoard dto) {
		int result=0;
		
		try {
			result=dao.insertData("questionBoard.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<QuestionBoard> listFile(int questionPostnum) {
		List<QuestionBoard> listFile=null;
		
		try {
			listFile=dao.selectList("questionBoard.listFile", questionPostnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}
	
	@Override
	public QuestionBoard readFile(int fileNum) {
		QuestionBoard dto=null;
		
		try {
			dto=dao.selectOne("questionBOard.readFile", fileNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	@Override
	public int deleteFile1(int questionPostnum) {
		int result=0;
		
		try {
			result=dao.deleteData("questionBoard.deleteFile1", questionPostnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int deleteFile2(int fileNum) {
		int result=0;
		
		try {
			result=dao.deleteData("questionBoard.deleteFile2", fileNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
