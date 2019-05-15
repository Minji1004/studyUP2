package com.sp.community.worryBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("worryBoard.worryboardService")
public class WorryBoardServiceImpl implements WorryBoardService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertWorryBoard(WorryBoard dto, String mode) {
		int result=0;
		
		try {
			int seq=dao.selectOne("worryBoard.seq");
			dto.setWorryPostNum(seq);
			
			if(mode.equals("created")) {
				dto.setGroupNum(seq);
			}else if(mode.equals("reply")) {
				//orderNo 변경
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("groupNum", dto.getGroupNum()+1);
				map.put("orderno",  dto.getOrderNo()+1);
				
				dao.updateData("worryBoard.updateOrderNo", map);
				
				dto.setDepth(dto.getDepth()+1);
				dto.setOrderNo(dto.getOrderNo()+1);
			}
			result=dao.insertData("worryBoard.insertBoard", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("worryBoard.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<WorryBoard> listWorryBoard(Map<String, Object> map) {
		List<WorryBoard> list=null;
		
		try {
			list=dao.selectList("worryBoard.listWorryBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public WorryBoard readWorryBoard(int worryPostnum) {
		WorryBoard dto=null;
		
		try {
			dto=dao.selectOne("worryBoard.readworryBoard", worryPostnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int worryPostnum) {
		int result=0;
		
		try {
			result=dao.updateData("worryBoard.updateHitCount", worryPostnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public WorryBoard preReadWorryBoard(Map<String, Object> map) {
		WorryBoard dto=null;
		
		try {
			dto=dao.selectOne("worryBoard.preReadWorryBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public WorryBoard nextReadWorryBoard(Map<String, Object> map) {
		WorryBoard dto=null;
		
		try {
			dto=dao.selectOne("worryBoard.preReadWorryBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateWorryBoard(WorryBoard dto) {
		int result=0;
		
		try {
			result=dao.updateData("worryBoard.updateWorryBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteWorryBoard(int worryPostnum) {
		int result=0;
		try {
			result=dao.deleteData("worryBoard.deleteWorryBoard, worryPostnum");
		} catch (Exception e) {
		}
		return result;
	}
}
