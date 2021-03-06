package com.sp.studyroom;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("studyroom.StudyRoomController")
public class StudyRoomController {
	
	@Autowired
	private StudyRoomService service;
	@Autowired
	private StudyRoomUtil srUtil;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "/studyroom/main")
	public String pageMain(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String sido_con,
			@RequestParam(defaultValue="all") String sigungu_con,
			@RequestParam(defaultValue="all") String bname_con,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();
		Map<String, Object> map = new HashMap<>();
		int rows = 4;
		int total_page = 0;
		int dataCount = 0;
		
		StudyRoomTable tdto = new StudyRoomTable();
		
		tdto.setSearchName("cafeNum");
		tdto.setTableName("cafe");
		
		dataCount = service.countNum(tdto);
		if(dataCount!=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page=total_page;
		
		int start = (current_page-1) * rows;
		if(start < 0) start = 0;
		map.put("start", start);
		map.put("rows", rows);
		
		List<StudyRoom> list = service.listStudyRoom(map);
		
		for( StudyRoom dto : list ) {
			// 리스트의 문자열 엔터 처리하기 
			String temp = dto.getCafeIntro().replaceAll("\n", "<br>");
			dto.setCafeIntro(temp);
			
			// 리스트의 파일위치 처리하기
			List<StudyRoomFile> tempList = service.fileList(dto.getCafeNum());
			String pictures = srUtil.picture(tempList);
			dto.setFileList(pictures);
		}
		
		String query = "";
		String listUrl;
		String modalUrl;
		
		listUrl = cp+"/studyroom/main";
		modalUrl = cp+"studyroom/modal/main?page=" + current_page;
		
		if(query.length()!=0) {
			listUrl = listUrl + "?" + query;
			modalUrl = modalUrl + "&" + query;
		}
		
		map.put("sido_con", sido_con);
		map.put("sigungu_con", sigungu_con);
		map.put("bname_con", bname_con); 
		
		String paging = srUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("modalUrl", modalUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("active", "1");
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		System.out.println(info +":"+info.getUserType());
		
		if(info !=null && info.getUserType().contains(1)) {
			return ".admins.studyroom.main";
		}	
		
		return ".four.studyroom.main";
	}
	
	
	@RequestMapping(value = "/studyroom/modal/main")
	public String modalMain(
			@RequestParam(value="cafeNum") int cafeNum,
			@RequestParam(value="page") int current_page,
			Model model
			) throws Exception {		 
		
		StudyRoom sr = service.studyRoom(cafeNum);
		
		// 카페 소개글 넘기기
		String intro = sr.getCafeIntro().replaceAll("\n", "<br>");
		sr.setCafeIntro(intro);
		
		// 카페 사진파일 넘기기
		List<StudyRoomFile> tempList = service.fileList(sr.getCafeNum());
		String pictures = srUtil.modalPicture(tempList);
		sr.setFileList(pictures);
		
		// 카페 룸 정보 넘기기
		List<StudyRoomDetail> studyRoomList = service.studyRoomList(sr.getCafeNum());
		
		for( StudyRoomDetail dto : studyRoomList ) {
			
			List<StudyRoomDetail> checkTime = service.studyRoomDetailList(dto.getRoomNum());
			System.out.println(checkTime);
			List<Integer> checkTimes = new ArrayList<>();
			for( StudyRoomDetail ctdto : checkTime  ) {
				checkTimes.add(ctdto.getCheckTime());
			}
			dto.setCheckTimes(checkTimes);
		}
		
		sr.setStudyRoomList(studyRoomList);
		
		model.addAttribute("radio_test", studyRoomList.get(0).getTimeOrRoom());
		model.addAttribute("page", current_page);		
		model.addAttribute("sr", sr);
		
		return "studyroom/modal/main";
	}
	
	@RequestMapping(value = "/studyroom/modal/created", method=RequestMethod.GET)
	public String modalWriteForm(
			Model model
			) throws Exception {		 
		
		model.addAttribute("mode", "created");
		return "studyroom/modal/write";
	}
	
	@RequestMapping(value = "/studyroom/modal/created", method=RequestMethod.POST)
	public String modalWriteSubmit(
			StudyRoom dto,
			StudyRoomTable tdto,
			HttpSession session
			) throws Exception {		 
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		// cafeNum 체크
		tdto.setSearchName("cafeNum");
		tdto.setTableName("cafe");
		int cafeNum = ((int)service.checkNum(tdto))+1;
		dto.setCafeNum(cafeNum);
		
		// cafe등록
		if(info!= null && dto!=null) {
			dto.setUserNum(info.getUserNum());
			service.insertStudyRoom(dto);
		
			// cafe세부 룸 등록 
			int rnum = dto.getRoomNames().size();
			if( rnum==0 ) {
				return "redirect:/studyroom/main";
			}
			tdto.setSearchName("roomNum");
			tdto.setTableName("cafeRoom");
			int roomNum = ((int)service.checkNum(tdto));
			int sum = 0 ;
			for( int i=0 ; i < rnum ; i++ ) {
				roomNum++;
				dto.setRoomNum(roomNum);
				dto.setRoomName(dto.getRoomNames().get(i));
				dto.setUnitPrice(dto.getUnitPrices().get(i));
				dto.setMaxUser(dto.getMaxUsers().get(i));
				dto.setMinUser(dto.getMinUsers().get(i));
				service.insertRooms(dto);
				
				// cafeRoomDetail에 들어갈 값 넣기
				int round = 0;
				round = Integer.parseInt(dto.getCheckboxCounts().get(i));
				for (int j=sum ; j<(sum+round) ; j++ ) {
					dto.setCheckTime(Integer.parseInt(dto.getCheckTimes().get(j)));
					service.insertRoomDetails(dto);
				}
				sum += round;					
			}
		}
		
		// cafe 그림 파일 넣기
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "studyroom";
		service.insertFile(dto, pathname);
		
		return "redirect:/studyroom/main";
	}
	
	@RequestMapping(value = "/studyroom/payment/bag", method=RequestMethod.GET)
	public String paymentBag(
			HttpSession session,
			Model model
			) throws Exception {		 
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info== null) {
			return "redirect:/member/login";
		}
		
		int userNum = info.getUserNum();
		List<StudyRoom> list = service.listCafeWish(userNum);
		for( StudyRoom dto : list ) {
			List<StudyRoomDetail> tlist = service.listCafeWishDetail(dto.getReserveNum());
			
			// 룸 정보 가져오기 
			StudyRoomDetail tempdto2 = service.checkCafeWishRoom(dto.getRoomNum());
			dto.setRoomName(tempdto2.getRoomName());
			dto.setTimeOrRoom(tempdto2.getTimeOrRoom());
			
			// 카페넘버, 정보 가져오기
			StudyRoom tempdto = service.checkCafeNum(dto.getRoomNum());
			int cafeNum = tempdto.getCafeNum();
			StudyRoom dto2 = service.studyRoom(cafeNum);
			
			System.out.println("================================");
			System.out.println("dto.getRoomNum()"+":"+dto.getRoomNum());
			System.out.println("cafeNum"+":"+cafeNum);
			System.out.println("dto2.getCafeName"+":"+dto2.getCafeName());
			System.out.println("================================");
			
			dto.setCafeName(dto2.getCafeName());
			dto.setRoadAddr(dto2.getRoadAddr());
			dto.setBuildName(dto2.getBuildName());
			dto.setDetailAddr(dto2.getDetailAddr());
			
			int count = tlist.size();
			int peopleNum = dto.getPeopleNum();
			int unitPrice = dto.getUnitPrice();
			
			int totPrice = count * peopleNum * unitPrice ;
			
			dto.setItemPrice(totPrice);
			
			String timelists ="";
			for ( int i=0 ; i<count ; i++ ) {
				if( (i+1)!=count ) {
					timelists += tlist.get(i).getCheckTime()+":00, ";					
				} else {
					timelists += tlist.get(i).getCheckTime()+":00";
				}
			}
			dto.setTimelists(timelists);
		}
		model.addAttribute("info", info);
		model.addAttribute("list", list);
		model.addAttribute("active", "2");
		
		return ".four.studyroom.payment.bag";
	}
	
	@RequestMapping(value = "/studyroom/insertBag", method=RequestMethod.POST)
	public String insertBag(
			StudyRoom dto,
			StudyRoomTable tdto,
			HttpSession session
			) throws Exception {		 
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info!= null && dto!=null) {
			dto.setUserNum(info.getUserNum());
			int rnum = dto.getRoomNums().size();
			if( rnum==0 ) {
				return "refirect:/studyroom/main";
			}
			int sum = 0;
			for ( int i=0 ; i <rnum ; i++ ) {
				if( dto.getCheckboxCounts().get(i) != "0") {
					
					tdto.setSearchName("reserveNum");
					tdto.setTableName("cafewish");
					int reserveNum = ((int)service.checkNum(tdto))+1;
					dto.setReserveNum(reserveNum);
					
					// 룸가격
					dto.setUnitPrice(dto.getUnitPrices().get(i));
					
					// 룸번호
					dto.setRoomNum(dto.getRoomNums().get(i));
					
					// 체크한 시간
					int round = 0;
					round = Integer.parseInt(dto.getCheckboxCounts().get(i));
					
					// 시간을 체크한 부분이 있다면,
					if(round >0) {
						service.insertCafeWish(dto);
					}
					
					for ( int j=sum ; j<(sum+round) ; j++ ) {
						dto.setCheckTime(Integer.parseInt(dto.getCheckTimes().get(j)));
						
						// 확인용
						System.out.println("=================================");
						System.out.println("UserNum"+" : "+ dto.getUserNum());
						System.out.println("RoomNum"+" : "+ dto.getRoomNum());
						System.out.println("useDate"+" : "+ dto.getUseDate());
						System.out.println("CheckTime"+" : "+ dto.getCheckTime());
						System.out.println("unitPrice"+" : "+ dto.getUnitPrice());
						System.out.println("=================================");
						
						service.insertCafeWishDetail(dto);
					}
					sum+=round;
				}
			}
		}
		
		return "redirect:/studyroom/payment/bag";
	}
	
	@RequestMapping(value = "/studyroom/payment/done")
	public String paymentDone(
			Model model
			) throws Exception {		 
		
		return ".four.studyroom.payment.done";
	}
	
	@RequestMapping(value = "/studyroom/payment/list", method=RequestMethod.GET)
	public String paymentList(
			Model model
			) throws Exception {		 
		
		model.addAttribute("active", "3");
		
		return ".four.studyroom.payment.list";
	}
	
	@RequestMapping(value = "/studyroom/payment/deleteBag", method=RequestMethod.POST)
	public String deleteBag(
			StudyRoom dto,
			HttpSession session
			) throws Exception {		 
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info!= null && dto!=null) {
			System.out.println("=================================");
			System.out.println("ReserveNum"+" : "+ dto.getReserveNum());
			System.out.println("=================================");
			
			service.deleteBagDetail(dto.getReserveNum());
			service.deleteBag(dto.getReserveNum());
			
		}
		
		return "redirect:/studyroom/payment/bag";
	}
	
}
