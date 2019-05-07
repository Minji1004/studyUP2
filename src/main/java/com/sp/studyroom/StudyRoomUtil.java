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
	
	public String modalPicture(List<StudyRoomFile> tempList) {
		StringBuffer sb = new StringBuffer();
		if(tempList!=null) {
			for(int i=0 ; i<tempList.size() ; i++) {
				if (i==0) {
					sb.append(" <div class='item active'> ");
				} else {
					sb.append(" <div class='item'> ");
				}
				sb.append(" <img class=\"srModalPic\" src=\"/studyUp/uploads/studyroom/"+tempList.get(i).getSaveFilename()+"\" alt=\"...\" height=\"100%\" width=\"100%\"> ");
				sb.append(" </div> ");
			}
		}
		
		return sb.toString();
	}
	
	public String paging(int current_page, int total_page, String list_url) {
		StringBuffer sb=new StringBuffer();
		
		int numPerBlock=10;
		int currentPageSetup;
		int n, page;
		
		if(current_page<1 || total_page < 1)
			return "";
		
		if(list_url.indexOf("?")!=-1)
			list_url+="&";
		else
			list_url+="?";
		
		// currentPageSetup : 표시할첫페이지-1
		currentPageSetup=(current_page/numPerBlock)*numPerBlock;
		if(current_page%numPerBlock==0)
			currentPageSetup=currentPageSetup-numPerBlock;

		sb.append("<style type='text/css'>");
		sb.append("#paginate {clear:both;font:12px \"맑은 고딕\",NanumGothic,돋움,Dotum,AppleGothic;padding:15px 0px 0px 0px;text-align:center;height:28px;white-space:nowrap;}");
		sb.append("#paginate a {border:1px solid #ccc;height:28px;color:#000000;text-decoration:none;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;outline:none; select-dummy: expression(this.hideFocus=true);}");
		sb.append("#paginate a:hover, a:active {background-color:#15a26e; border:1px solid #15a26e; color:#ffffff;vertical-align:middle; line-height:normal;}");
		sb.append("#paginate .curBox {background-color:#0b7142; border:1px solid #0b7142; color:#ffffff; font-weight:bold;height:28px;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;}");
		sb.append("#paginate .numBox {border:1px solid #ccc;height:28px;font-weight:bold;text-decoration:none;padding:4px 7px 4px 7px;margin-left:3px;line-height:normal;vertical-align:middle;}");
		sb.append("</style>");
		
		sb.append("<div id='paginate'>");
		// 처음페이지, 이전(10페이지 전)
		n=current_page-numPerBlock;
		if(total_page > numPerBlock && currentPageSetup > 0) {
			sb.append("<a href='"+list_url+"page=1'>처음</a>");
			sb.append("<a href='"+list_url+"page="+n+"'>이전</a>");
		}
		
		// 바로가기
		page=currentPageSetup+1;
		while(page<=total_page && page <=(currentPageSetup+numPerBlock)) {
			if(page==current_page) {
				sb.append("<span class='curBox'>"+page+"</span>");
			} else {
				sb.append("<a href='"+list_url+"page="+page+"' class='numBox'>"+page+"</a>");
			}
			page++;
		}
		
		// 다음(10페이지 후), 마지막페이지
		n=current_page+numPerBlock;
		if(n>total_page) n=total_page;
		if(total_page-currentPageSetup>numPerBlock) {
			sb.append("<a href='"+list_url+"page="+n+"'>다음</a>");
			sb.append("<a href='"+list_url+"page="+total_page+"'>끝</a>");
		}
		sb.append("</div>");
	
		return sb.toString();
	}
	
}
