package com.sp.teacher;

import java.util.regex.Pattern;

import org.springframework.stereotype.Service;

@Service("teacherUtil")
public class TeacherUtil {

	public static String makePhoneNumber(String phoneNumber) {

		   String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";

		   if(!Pattern.matches(regEx, phoneNumber)) return null;	   

		   return phoneNumber.replaceAll(regEx, "$1-$2-$3");  

	   }	
	
	public String paging(int current_page, int total_page) {
		if(current_page < 1 || total_page < 1)
			return "";

        int numPerBlock = 5;   // 리스트에 나타낼 페이지 수
        int currentPageSetUp;
        int n;
        int page;
        StringBuffer sb=new StringBuffer();
        
        // 표시할 첫 페이지
        currentPageSetUp = (current_page / numPerBlock) * numPerBlock;
        if (current_page % numPerBlock == 0)
            currentPageSetUp = currentPageSetUp - numPerBlock;
        
		sb.append("<ul class='pagination pagination-sm no-margin pull-right'>");
        
        // 처음페이지, 이전(10페이지 전)
        n = current_page - numPerBlock;
        if ((total_page > numPerBlock) && (currentPageSetUp > 0)) {
			sb.append("<li><a onclick='listPage("+n+");'>&laquo;</a></li>");
        }

        // 바로가기 페이지 구현
        page = currentPageSetUp + 1;
        while((page <= total_page) && (page <= currentPageSetUp + numPerBlock)) {
           if(page == current_page) {
        	   sb.append("<li><span class='curBox'>"+page+"</span></li>");
           } else {
			   sb.append("<li><a onclick='listPage("+page+");'>"+page+"</a></li>");
           }
           page++;
        }

        // 다음(10페이지 후), 마지막 페이지
        n = current_page + numPerBlock;
		if(n>total_page) n=total_page;
        if (total_page - currentPageSetUp > numPerBlock) {
			sb.append("<li><a onclick='listPage("+n+");'>&raquo;</a></li>");
        }
		sb.append("</ul>");

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

		sb.append("<ul class='pagination pagination-sm no-margin pull-right'>");
		// 처음페이지, 이전(10페이지 전)
		n=current_page-numPerBlock;
		if(total_page > numPerBlock && currentPageSetup > 0) {
			sb.append("<li><a href='"+list_url+"page=1'>처음</a></li>");
			sb.append("<li><a href='"+list_url+"page="+n+"'>&laquo;</a></li>");
		}
		// 바로가기
		page=currentPageSetup+1;
		while(page<=total_page && page <=(currentPageSetup+numPerBlock)) {
			if(page==current_page) {
				sb.append("<li><span class='curBox'>"+page+"</span></li>");
			} else {
				sb.append("<li><a href='"+list_url+"page="+page+"'>"+page+"</a></li>");
			}
			page++;
		}
		
		// 다음(10페이지 후), 마지막페이지
		n=current_page+numPerBlock;
		if(n>total_page) n=total_page;
		if(total_page-currentPageSetup>numPerBlock) {
			sb.append("<li><a href='"+list_url+"page="+n+"'>&raquo;</a></li>");
			sb.append("<li><a href='"+list_url+"page="+total_page+"'>끝</a></li>");
		}
		sb.append("</ul>");
	
		return sb.toString();
	}
}
