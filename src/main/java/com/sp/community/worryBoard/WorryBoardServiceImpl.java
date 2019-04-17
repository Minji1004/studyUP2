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
	public int insertWorBoard(WorryBoard dto, String pathname) {
		int result=0;
		try {
			int maxNum=dao.selectOne("worboard.w_postNum");
			dto.setW_postNum(maxNum+1);
			
			result=dao.insertData("worboard.insertBoard",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("worboard.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<WorryBoard> listWorBoard(Map<String, Object> map) {
		List<WorryBoard> list=null;
		
		try {
			//list=dao.selectList()
		} catch (Exception e) {
			
		}
		return null;
	}

	@Override
	public List<WorryBoard> listWorBoardTop() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public WorryBoard readWorBoard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WorryBoard preReadWorBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WorryBoard nextReadWorBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateWorBoard(WorryBoard dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteWorBoard(int num, String pathname) {
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
