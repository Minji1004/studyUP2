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

import com.sp.common.FileManager;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("studyroom.StudyRoomController")
public class StudyRoomController {
	
	@Autowired
	private StudyRoomService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "/studyroom/main")
	public String pageMain(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String sido_con,
			@RequestParam(defaultValue="all") String sigungu_con,
			@RequestParam(defaultValue="all") String bname_con,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		int rows = 6;
		int total_page = 0;
		int dataCount = 0;
		
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
			if(tempList!=null) {
				dto.setFileList(tempList);
			} else {
				dto.setFileList(null);
			}
		}
		
		map.put("sido_con", sido_con);
		map.put("sigungu_con", sigungu_con);
		map.put("bname_con", bname_con); 
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listStudyRoom");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		
		return ".four.studyroom.main";
	}
	
	
	@RequestMapping(value = "/studyroom/modal/main")
	public String modalMain() {		 
		
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
				int round = Integer.parseInt(dto.getCheckboxCounts().get(i));
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
		
		return ".four.studyroom.main";
	}
	
}
