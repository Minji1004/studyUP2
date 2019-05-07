package com.sp.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.member.SessionInfo;

@Controller("mypage.schedulerController")
public class SchedulerController {
	@Autowired
	private ResourceService service;
	
	@RequestMapping(value="/mypage/schedule/resources")
	@ResponseBody
	public List<ResourceJSON> resources(HttpServletResponse resp) throws Exception {
		List<ResourceJSON> list=service.listResourceList();
		return list;
	}
	
/*
	@RequestMapping(value="/scheduler/resources")
	public void resources(HttpServletResponse resp) throws Exception {
		List<ResourceJSON> list=service.listResourceList();
		
		JSONObject job=new JSONObject();
		job.put("list", list);

		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");

		PrintWriter out = resp.getWriter();
		out.print(job.get("list"));
		out.flush();
		out.close();
	}
*/
	
	@RequestMapping(value="/mypage/schedule/events")
	@ResponseBody
	public List<ResourceJSON> events(
			@RequestParam String start,
			@RequestParam String end
			) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		List<ResourceJSON> list=service.listResourceScheduler(map);
		return list;
	}

	@RequestMapping(value="/mypage/schedule/inputForm")
	public String inputForm(Model model) throws Exception {
		List<Resource> groupList=service.listResourceGroup();
		
		model.addAttribute("groupList", groupList);
		return "mypage/schedule/inputForm";
	}

	@RequestMapping(value="/mypage/schedule/readResourceList")
	@ResponseBody
	public Map<String, Object> readResourceList(int resourceNum) throws Exception {
		Resource dto=service.readResourceList(resourceNum);
		
		Map<String, Object> model=new HashMap<>();
		String state="true";
		if(dto==null) {
			state="false";
		} else {
			model.put("dto", dto);
		}
		
		model.put("state", state);
		return model;
	}

	@RequestMapping(value="/mypage/schedule/listResourceList")
	@ResponseBody
	public Map<String, Object> listResourceList(int groupNum) throws Exception {
		List<Resource> list=service.listResourceList(groupNum);
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	@RequestMapping(value="/mypage/schedule/schedulerInsert")
	@ResponseBody
	public Map<String, Object> schedulerInsert(Resource dto,
			HttpSession session
			) throws Exception {
		String state="true";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		
		service.insertResourceScheduler(dto);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/mypage/schedule/articleForm")
	public String articleForm(Model model) throws Exception {
		return "mypage/schedule/articleForm";
	}
	
	@RequestMapping(value="/mypage/schedule/schedulerUpdate")
	@ResponseBody
	public Map<String, Object> schedulerUpdate(Resource dto,
			HttpSession session
			) throws Exception {
		String state="true";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setUserId(info.getUserId());
		
		int result=service.updateResourceScheduler(dto);
		if(result==0)
			state="false";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value="/mypage/schedule/schedulerDelete")
	@ResponseBody
	public Map<String, Object> schedulerDelete(int num,
			HttpSession session
			) throws Exception {
		String state="true";
		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("num", num);
		
		int result=service.deleteResourceScheduler(map);
		if(result==0)
			state="false";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
}
