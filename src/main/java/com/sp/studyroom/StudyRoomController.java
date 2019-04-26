package com.sp.studyroom;

import javax.servlet.http.HttpSession;
import org.springframework.web.multipart.MultipartFile;
import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String pageMain() {		 
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
				System.out.println(dto.getCheckboxCounts().get(0));
				int round = Integer.parseInt(dto.getCheckboxCounts().get(i));
				if( i==1 ) {
					for (int j=0 ; j<round ; j++ ) {
						dto.setCheckTime(Integer.parseInt(dto.getCheckTimes().get(i)));
						service.insertRoomDetails(dto);
					}
				} else {
					for (int j=sum ; j<(sum+round) ; j++ ) {
						dto.setCheckTime(Integer.parseInt(dto.getCheckTimes().get(i)));
						service.insertRoomDetails(dto);
					}
				}
				sum += round;
			}
		}
		
		
		
		
		return ".four.studyroom.main";
	}
	
}
