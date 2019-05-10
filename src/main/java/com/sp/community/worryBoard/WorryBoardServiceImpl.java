package com.sp.community.worryBoard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("worboard.WorBoardService")
public class WorryBoardServiceImpl implements WorryBoardService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertWorryBoard(WorryBoard dto, String pathname) {
		int result=0;
		
		try {
			int maxNum=dao.selectOne("worryboard.worryPostnum");
			dto.setWorryPostnum(maxNum+1);
			
			result=dao.insertData("worryboard.insertBoard",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("worryboard.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<WorryBoard> listWorryBoard(Map<String, Object> map) {
		List<WorryBoard> list=null;
		
		try {
			list=dao.selectList("worryboard.listWorry", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<WorryBoard> listWorryBoardTop() {
		List<WorryBoard> list=null;
		
		try {
			list=dao.selectList("worryBoard.listWorryBoardTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
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
	public WorryBoard readWorryBoard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WorryBoard preReadWorryBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WorryBoard nextReadWorryBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateWorryBoard(WorryBoard dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteWorryBoard(int num, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFile(WorryBoard dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<WorryBoard> listFile(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WorryBoard readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
