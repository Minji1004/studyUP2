package com.sp.community.questionBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("community.questionboardService")
public class QuestionBoardServiceImpl implements QuestionBoardService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertQuestionBoard(QuestionBoard dto, String mode) {
		int result=0;
		
		try {
			int seq=dao.selectOne("questionBoard.seq");
			dto.setQuestionPostnum(seq);
			
			if(mode.equals("created")) {
				dto.setGroupNum(seq);
			}else if(mode.equals("reply")) {
				//orderNo 변경
				Map<String, Object> map=new HashMap<String,Object>();
				map.put("groupNum" , dto.getGroupNum());
				map.put("orderNo", dto.getOrderNo());
				
				dao.updateData("questionBoard.updateOrderNo", map);
				
				dto.setDepth(dto.getDepth()+1);
				dto.setOrderNo(dto.getOrderNo()+1);
			}
			
			result=dao.insertData("questionBoard.insertBoard", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
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
			System.out.println(e.toString());
		}
		return list;
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
	public int updateHitCount(int questionPostnum) {
		int result=0;
		
		try {
			result=dao.updateData("questionBoard.updateHitCount", questionPostnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public QuestionBoard preReadQuestionBoard(Map<String, Object> map) {
		QuestionBoard dto=null;
		
		try {
			dto=dao.selectOne("questionBoard.preReadQuestionBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	@Override
	public QuestionBoard nextReadQuestionBoard(Map<String, Object> map) {
		QuestionBoard dto=null;
		
		try {
			dto=dao.selectOne("questionBoard.nextReadquestionBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		} 
		return dto;
	}
	@Override
	public int updateQuestionBoard(QuestionBoard dto) {
		int result=0;
		
		try {
			result=dao.updateData("questionBoard.updateQuestionBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int deleteQuestionBoard(int questionPostnum) {
		int result=0;
		try {
			result=dao.deleteData("questionBoard.deleteQuestionBoard", questionPostnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
