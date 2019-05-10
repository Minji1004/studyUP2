package com.sp.study.mystudy.chart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.study.Study;
import com.sp.study.StudyService;

@Controller("study.chartController")
public class ChartController {
	@Autowired
	private StudyService service;
	
	@RequestMapping(value="/study/record/main")
	public String main(
			@RequestParam int studyNum,
			@RequestParam(defaultValue="6") int left,
			Model model) throws Exception {
		
		Study dto = service.readStudy(studyNum);
		
		model.addAttribute("studyNum", studyNum);
		model.addAttribute("left", left);
		model.addAttribute("dto", dto);
		
		return ".study.hchart.main";
	}
	
	
	@RequestMapping(value="/study/pie3d", produces="application/json; charset=utf-8")
	@ResponseBody
	public String pie3d() throws Exception {
		JSONArray arr=new JSONArray();
		
		JSONObject ob=new JSONObject();
		ob.put("name", "공부시간");
		
		JSONArray ja=new JSONArray();
		ja.put(new JSONArray("['국어', 1]"));
		ja.put(new JSONArray("['영어', 0.5]"));
		ja.put(new JSONArray("['한국사', 2]"));
		ja.put(new JSONArray("['생활과 윤리', 2]"));
		ja.put(new JSONArray("['윤리와 사상', 0.5]"));
		ja.put(new JSONArray("['경제', 1]"));
		ja.put(new JSONArray("['법과정치', 2]"));
		ja.put(new JSONArray("['수학-나', 2]"));
		
		ob.put("data", ja);
		
		arr.put(ob);

		return arr.toString();
	}
	
	
	@RequestMapping(value="/study/line")
	@ResponseBody
	public Map<String, Object> line() throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map;
		
		map = new HashMap<>();
		map.put("name", "한다혜");
		map.put("data", new double[]{10.0, 5.5, 6.0, 7.0});
		list.add(map);

		map = new HashMap<>();
		map.put("name", "이민지");
		map.put("data", new double[]{8.0, 7.5, 6.5, 7.5});
		list.add(map);

		map = new HashMap<>();
		map.put("name", "이재민");
		map.put("data", new double[]{8.0, 6.5, 8.0, 5.0});
		list.add(map);
		
		model.put("series", list);
		
		return model;
	}
	
	

}
