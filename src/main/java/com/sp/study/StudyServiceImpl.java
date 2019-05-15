package com.sp.study;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("study.studyService")
public class StudyServiceImpl implements StudyService{	
	@Autowired
	private CommonDAO dao;	
	@Autowired
	private FileManager fileManager;
	

	@Override
	public int insertStudy(Study dto, String pathname) {
		int result = 0;
		
		try {
			if(dto.getUpload() != null && ! dto.getUpload().isEmpty()) {
				String studyImg = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setStudyImg(studyImg);
			}
			
			int maxNum = dao.selectOne("study.maxStudyNum");
			int studyNum = maxNum+1;
			
			dto.setStudyNum(studyNum);

			dao.insertData("study.insertStudy", dto);
			
			if(dto.getCourseNums() != null) {
				StudyCourse sdto;
				for(int s : dto.getCourseNums()) {
					sdto = new StudyCourse();
					
					sdto.setStudyNum(studyNum);
					sdto.setCourseNum(s);
					dao.insertData("study.insertStudyCourse", sdto);
				}				
			}
			
			// 스터디 마스터는 스터디 생성시 자동으로 가입허가가 된다.
			ApplyStudy adto = new ApplyStudy();
			adto.setUserId(dto.getUserId());
			adto.setStudyNum(studyNum);
			adto.setApproval(2);
			
			dao.insertData("study.applyStudyMaster", adto);
			
			
			result = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Study> listStudy(Map<String, Object> map) {
		List<Study> list = null;
		
		try {
			list = dao.selectList("study.listStudy", map);	
			
			for(Study s : list) {
				s.setCourseLists(listStudyCourse(s.getStudyNum()));
				s.setApplyCount(headCount(s.getStudyNum()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("study.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Study readStudy(int num) {
		Study dto = null;
		
		try {
			dto = dao.selectOne("study.readStudy", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int updateStudy(Study dto, String pathname) {
		int result=0;

		try{
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				// 이전파일 지우기
				if(dto.getStudyImg().length()!=0)
					fileManager.doFileDelete(dto.getStudyImg(), pathname);
				
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				if (newFilename != null) {
					dto.setStudyImg(dto.getUpload().getOriginalFilename());
					dto.setStudyImg(newFilename);
				}
			}
			
			dao.updateData("study.updateStudy", dto);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteStudy(int num, String studyImg, String pathname) {
		int result = 0;
		
		try{
			// 댓글, 좋아요/싫어요 는 ON DELETE CASCADE 로 자동 삭제
			if(studyImg != null ) {
			  fileManager.doFileDelete(studyImg, pathname);
			}
			
			dao.deleteData("study.deleteStudy", num);
			result=1;
			
		} catch(Exception e) {
		}
		
		return result;
	}

	@Override
	public List<StudyCourse> listStudyCourse(int studyNum) {		
		// 스터디의 과목 리스트
		List<StudyCourse> list = null;
		
		try {
			list = dao.selectList("study.listStudyCourse", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int headCount(int studyNum) {
		int result = 0;
		
		try {
			result = dao.selectOne("study.headCount", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Study> studyMember(int studyNum) {
		List<Study> list = null;
		
		try {
			list = dao.selectList("study.studyMember", studyNum);	
			
			for(Study s : list) {
				s.setCourseLists(listStudyCourse(s.getStudyNum()));
				s.setApplyCount(headCount(s.getStudyNum()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}	
