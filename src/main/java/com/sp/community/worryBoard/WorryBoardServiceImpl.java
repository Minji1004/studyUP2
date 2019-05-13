package com.sp.community.worryBoard;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("worryBoard.worryboardService")
public class WorryBoardServiceImpl implements WorryBoardService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	@Override
	public int insertWorryBoard(WorryBoard dto, String pathname) {
		int result=0;
		
		try {
			int maxNum=dao.selectOne("worryBoard.worryPostnum");
			dto.setWorryPostnum(maxNum+1);
			
			result=dao.insertData("worryBoard.insertBoard",dto);
		} catch (Exception e) {
			e.printStackTrace();
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
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<WorryBoard> listWorryBoardTop() {
		List<WorryBoard> list=null;
		
		try {
			list=dao.selectList("worryBoard.listworryBoardTop");
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
	public WorryBoard readWorryBoard(int worryBoardnum) {
		WorryBoard dto=null;
		
		try {
			dto=dao.selectOne("worryBoard.readworryBoard", worryBoardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public WorryBoard preReadworryBoard(Map<String, Object> map) {
		WorryBoard dto=null;
		
		try {
			dto=dao.selectOne("worryBoard.preReadworryBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public WorryBoard nextReadworryBoard(Map<String, Object> map) {
		WorryBoard dto=null;
		
		try {
			dto=dao.selectOne("worryBoard.preReadworryBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateWorryBoard(WorryBoard dto, String pathname) {
		int result=0;
		
		try {
			result=dao.updateData("worryBoard.updateworryBoard", dto);
			
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
	public int deleteWorryBoard(int worryBoardnum, String pathname) {
		int result=0;
		try {
			// 파일 지우기
			List<WorryBoard> listFile=listFile(worryBoardnum);
			if(listFile!=null) {
				Iterator<WorryBoard> it=listFile.iterator();
				while(it.hasNext()) {
					WorryBoard dto=it.next();
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			//파일 테이블 내용 지우기
			deleteFile1(worryBoardnum);
			
			result=dao.deleteData("worryBoard.deleteWorryBoard", worryBoardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertFile(WorryBoard dto) {
		int result=0;
		
		try {
			result=dao.insertData("worryBoard.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<WorryBoard> listFile(int worryBoardnum) {
		List<WorryBoard> listFile=null;
		
		try {
			listFile=dao.selectList("worryBoard.listFile", worryBoardnum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}

	@Override
	public WorryBoard readFile(int fileNum) {
		WorryBoard dto=null;
		
		try {
			dto=dao.selectOne("worryBoard.readFile", fileNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int deleteFile1(int worryBoardnum) {
		int result=0;
		
		try {
			result=dao.deleteData("worryBoard.deleteFile1", worryBoardnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	@Override
	public int deleteFile2(int fileNum) {
		int result=0;
		
		try {
			result=dao.deleteData("worryBoard.deleteFile2", fileNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
