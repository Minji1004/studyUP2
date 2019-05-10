package com.sp.study.mystudy.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.study.ApplyStudy;
import com.sp.study.ApplyStudyService;
import com.sp.study.Study;
import com.sp.study.StudyService;

@Controller("study.memberController")
public class MemberController {
	@Autowired
	private StudyService studyService;
	
	@Autowired
	private ApplyStudyService applyService;
	
	@RequestMapping(value="/study/member/main")
	public String main(
			@RequestParam int studyNum,
			@RequestParam(defaultValue="9") int left,
			Model model) throws Exception {
		
		List<Study> memberList = studyService.studyMember(studyNum);
		
		Study dto = studyService.readStudy(studyNum);
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("studyNum", studyNum);
		
		List<ApplyStudy> applyList = applyService.listApplyStudy(map);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("applyList", applyList);
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		model.addAttribute("dto", dto);
		
		return ".study.member.main";
	}
	
	@RequestMapping(value="/study/member/approve")
	public String approve(
			@RequestParam int studyNum,
			@RequestParam int applyNum,
			@RequestParam(defaultValue="9") int left) throws Exception {
		
		ApplyStudy apply = applyService.readApplyStudy(applyNum);
		
		apply.setApproval(2);
		applyService.updateApplyStudy(apply);
		
		
		return "redirect:/study/member/main?studyNum="+studyNum+"&left="+left;
	}

}
