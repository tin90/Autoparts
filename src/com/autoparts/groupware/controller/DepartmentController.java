package com.autoparts.groupware.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	@SuppressWarnings("unchecked")
	@RequestMapping("/add.html")
	public String add(Model model){
		JSONArray json = new JSONArray();
		JSONObject d1 = new JSONObject();
		d1.put("name","경영전략실");
		d1.put("empCount", new Integer(2));
		json.add(d1);
		JSONObject d2 = new JSONObject();
		d2.put("name","영업부");
		d2.put("empCount", new Integer(5));
		json.add(d2);
		
		model.addAttribute("list", json.toJSONString());
		model.addAttribute("delComment", "수정/삭제할 부서를 선택하세요.");
		model.addAttribute("modComment", "부서명을 수정하세요.");
		model.addAttribute("inputComment", "부서명을 입력하세요.");
		model.addAttribute("delFailComment", "사원이 등록된 부서는 삭제할 수 없습니다.");
		model.addAttribute("title", "부서 등록");
		return "commons/add.tiles";
	}
}
