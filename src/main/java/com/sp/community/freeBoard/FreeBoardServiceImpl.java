package com.sp.community.freeBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("community.freeboardService")
public class FreeBoardServiceImpl implements FreeBoardService{
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertFreeBoard(FreeBoard dto, String mode) {
		int result=0;
		
		try {
			int seq=dao.selectOne("freeboard.maxFreeBoardNum");
			dto.setFreePostNum(seq+1);
			
			if(mode.equals("created")) {
				dto.setGroupNum(seq+1);
			} else if(mode.equals("reply")) {
				// orderNo 변경
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("groupNum", dto.getGroupNum());
				map.put("orerNo", dto.getOrderNo());
				
				dao.updateData("freeboard.updateOrderNo", map);
				
				dto.setDepth(dto.getDepth()+1);
				dto.setOrderNo(dto.getOrderNo()+1);
			}
			
			result=dao.insertData("freeboard.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("freeboard.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<FreeBoard> listFreeBoard(Map<String, Object> map) {
		List<FreeBoard> list=null;
		
		try {
			list=dao.selectList("freeboard.listFreeBoard", map);
		} catch (Exception e) {
			System.out.println();
		}
		return list;
	}

	@Override
	public FreeBoard readFreeBoard(int freeBoardnum) {
		FreeBoard dto=null;
		
		try {
			dto=dao.selectOne("freeboard.readFreeBoard", freeBoardnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public FreeBoard preReadFreeBoard(Map<String, Object> map) {
		FreeBoard dto=null;
		
		try {
			dto=dao.selectOne("freeboard.preReadFreeBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public FreeBoard nextReadFreeBoard(Map<String, Object> map) {
		FreeBoard dto=null;
		
		try {
			dto=dao.selectOne("freeboard.nextReadFreeBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int freeBoardnum) {
		int result=0;
		
		try {
			result=dao.updateData("freeboard.updateHitCount", freeBoardnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateFreeBoard(FreeBoard dto) {
		int result=0;
		
		try {
			result=dao.updateData("freeboard.updateFreeBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteFreeBoard(int freeBoardnum) {
		int result=0;
		
		try {
			result=dao.deleteData("freeboard.deleteFreeBoard", freeBoardnum);
		} catch (Exception e) {
		}
		return result;
	}
}
