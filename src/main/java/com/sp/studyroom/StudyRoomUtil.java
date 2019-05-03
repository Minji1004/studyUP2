package com.sp.studyroom;

import java.util.List;

import org.springframework.stereotype.Service;

@Service("studyRoomUtil")
public class StudyRoomUtil {
	
	public String picture(List<StudyRoomFile> tempList) {
		StringBuffer sb = new StringBuffer();
		if(tempList!=null) {
			for(int i=0 ; i<tempList.size() ; i++) {
				if (i==0) {
					sb.append(" <div class='item active'> ");
				} else {
					sb.append(" <div class='item'> ");
				}
				sb.append(" <img class=\"srPic\" src=\"/studyUp/uploads/studyroom/"+tempList.get(i).getSaveFilename()+"\" alt=\"...\" height=\"100%\" width=\"100%\"> ");
				sb.append(" </div> ");
			}
		}
		
		return sb.toString();
	}
	
}
