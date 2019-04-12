package com.sp.community.worryBoard;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service("worboard.worBoardService")
public class WorryBoardServiceImpl implements WorryBoardService {

	@Override
	public int insertWorBoard(WorryBoard dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<WorryBoard> listWorBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
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
