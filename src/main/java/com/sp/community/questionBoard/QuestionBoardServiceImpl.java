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
			int seq=dao.selectOne("questionboard.maxQuestionBoardNum");
			dto.setQuestionPostNum(seq+1);
			
			if(mode.equals("created")) {
				dto.setGroupNum(seq+1);
			}else if(mode.equals("reply")) {
				//orderNo 변경
				Map<String, Object> map=new HashMap<String,Object>();
				map.put("groupNum" , dto.getGroupNum());
				map.put("orderNo", dto.getOrderNo());
				
				dao.updateData("questionboard.updateOrderNo", map);
				
				dto.setDepth(dto.getDepth()+1);
				dto.setOrderNo(dto.getOrderNo()+1);
			}
			
			result=dao.insertData("questionboard.insertQuestionBoard", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("questionboard.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public List<QuestionBoard> listQuestionBoard(Map<String, Object> map) {
		List<QuestionBoard> list=null;
		
		try {
			list=dao.selectList("questionboard.listQusetionBoard", map);
		} catch (Exception e) {
			System.out.println();
		}
		return list;
	}
	
	@Override
	public QuestionBoard readQuestionBoard(int questionBoardnum) {
		QuestionBoard dto=null;
		
		try {
			dto=dao.selectOne("questionboard.readquestionBoard", questionBoardnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public QuestionBoard preReadQuestionBoard(Map<String, Object> map) {
		QuestionBoard dto=null;
		
		try {
			dto=dao.selectOne("questionboard.preReadQuestionBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	@Override
	public QuestionBoard nextReadQuestionBoard(Map<String, Object> map) {
		QuestionBoard dto=null;
		
		try {
			dto=dao.selectOne("questionboard.nextReadquestionBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
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
	public int deleteQuestionBoard(int questionBoardNum) {
		int result=0;
		try {
			boolean isStart=true;
			int depth=0;
			List<QuestionBoard> list=dao.selectList("questionboard.deleteListQuestionBoard", questionBoardNum);
			for(QuestionBoard dto:list) {
				if(isStart) {
					depth=dto.getDepth();
					isStart=false;
					dao.deleteData("questionboard.deleteQuestionBoard", dto.getQuestionPostNum());
					continue;
				}
				
				if(depth < dto.getDepth()) {
					dao.deleteData("questionboard.deleteQuestionBoard", dto.getQuestionPostNum());
				} else {
					break;
				}
			}
		} catch (Exception e) {
		}
		return result;
	}
}
