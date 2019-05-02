package com.sp.customer.inquiry;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("customer.inquiryService")
public class InquiryServiceImpl implements InquiryService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertInquiry(Inquiry dto, String pathname) {
		int result=0;
		
		try {
			int maxNum=dao.selectOne("inquiry.maxInquiryNum");
			int inquiryNum=maxNum+1;
			dto.setInquiryNum(inquiryNum);
			
			dao.insertData("inquiry.insertInquiry",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("inquiry.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Inquiry> listInquiry(Map<String, Object> map) {
		List<Inquiry> list=null;
		
		try {
			list=dao.selectList("inquiry.listInquiry", map);
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		return list;
	}
	
	@Override
	public List<Inquiry> relationInquiry(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Inquiry readInquiry(int InquiryNum) {
		Inquiry dto=null;
		
		try {
			dto=dao.selectOne("inquiry.readInquiry", InquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateInquiryState(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateInquiry(Inquiry dto,String pathname) {
		int result=0;
		
		try {
			result=dao.updateData("inquiry.updateInquiry", dto);
			
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
	public int deleteInquiry(int inquiryNum, String pathname) {
		int result=0;
		
		try {
			List<Inquiry> listFile=listFile(inquiryNum);
			if(listFile!=null) {
				Iterator<Inquiry> it=listFile.iterator();
				while(it.hasNext()) {
					Inquiry dto=it.next();
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
				deleteFile1(inquiryNum);
				
				result=dao.deleteData("inquiry.deleteInquiry", inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//파일
	
	@Override
	public List<Inquiry> listFile(int inquiryNum){
		List<Inquiry> listFile=null;
		
		try {
			listFile=dao.selectList("inquiry.listFile", inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listFile;
	}

	@Override
	public int insertFile(Inquiry dto) {
		int result=0;
		try {
			result=dao.insertData("inquiry.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Inquiry readFile(int fileNum) {
		Inquiry dto=null;
		
		try {
			dto=dao.selectOne("inquiry.readFile", fileNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int deleteFile1(int inquiryNum) {
		int result=0;
		
		try {
			result=dao.deleteData("inquiry.deleteFile1", inquiryNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteFile2(int fileNum) {
		int result=0;
		
		try {
			result=dao.deleteData("inquiry.deleteFile2", fileNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
