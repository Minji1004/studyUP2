package com.sp.studyroom;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("studyroom.studyRoomService")
public class StudyRoomServiceImpl implements StudyRoomService {
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int checkNum(StudyRoomTable tdto) {
		int result=0;
		try {
			result=dao.selectOne("studyroom.searchNum", tdto);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int insertStudyRoom(StudyRoom dto) {
		int result=0;
		try {
			result=dao.insertData("studyroom.insertCafe", dto);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return result;
	}
	
	
	
	@Override
	public int insertRooms(StudyRoom dto) {
		int result=0;
		try {
			result=dao.insertData("studyroom.insertCafeRoom", dto);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int insertRoomDetails(StudyRoom dto) {
		int result=0;
		try {
			result=dao.insertData("studyroom.insertCafeRoomDetail", dto);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<StudyRoom> listStudyRoom(Map<String, Object> map) {
		List<StudyRoom> list = null;
		try {
			list = dao.selectList("studyroom.listStudyRoom", map);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertFile(StudyRoom dto, String pathname) {
		int result=0;
		try {
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf : dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
						String filename = mf.getOriginalFilename();
						dto.setImgFilename(filename);
						dto.setSaveFilename(saveFilename);
						result=dao.insertData("studyroom.insertCafeFile", dto);
					}
				}
			}
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<StudyRoomFile> fileList(int num) {
		List<StudyRoomFile> list = null;
		try {
			list = dao.selectList("listStudyRoomFile", num);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int countNum(StudyRoomTable tdto) {
		int result=0;
		try {
			result=dao.selectOne("studyroom.countNum", tdto);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public StudyRoom studyRoom(int cafeNum) {
		StudyRoom dto = null;
		try {
			dto = dao.selectOne("studyroom.studyRoom", cafeNum);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public List<StudyRoomDetail> studyRoomList(int num) {
		List<StudyRoomDetail> list = null;
		try {
			list = dao.selectList("studyroom.studyRoomList", num);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<StudyRoomDetail> studyRoomDetailList(int num) {
		List<StudyRoomDetail> list = null;
		try {
			list = dao.selectList("studyroom.studyRoomTimeList", num);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int insertCafeWish(StudyRoom dto) {
		int result=0;
		try {
			result=dao.insertData("studyroom.insertCafeWish", dto);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int insertCafeWishDetail(StudyRoom dto) {
		int result=0;
		try {
			result=dao.insertData("studyroom.insertCafeWishDetail", dto);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<StudyRoom> listCafeWish(int userNum) {
		List<StudyRoom> list = null;
		try {
			list = dao.selectList("studyroom.listCafeWish", userNum);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<StudyRoomDetail> listCafeWishDetail(int reserveNum) {
		List<StudyRoomDetail> list = null;
		try {
			list = dao.selectList("studyroom.listCafeWishDetail", reserveNum);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public StudyRoom checkCafeNum(int roomNum) {
		StudyRoom dto=null;
		try {
			dto = dao.selectOne("studyroom.checkCafeNum", roomNum);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return dto;
	}
	
	//장바구니용 룸 디테일
	@Override
	public StudyRoomDetail checkCafeWishRoom(int roomNum) {
		StudyRoomDetail dto=null;
		try {
			dto = dao.selectOne("studyroom.studyRoomCafeWish", roomNum);
		} catch (Exception e) {
			// e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public int deleteBag(int reserveNum) {
		int result=0;
		try {
			result=dao.deleteData("studyroom.deleteBag", reserveNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public int deleteBagDetail(int reserveNum) {
		int result=0;
		try {
			result=dao.deleteData("studyroom.deleteBagDetail", reserveNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
