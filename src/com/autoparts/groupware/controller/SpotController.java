package com.autoparts.groupware.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/spot")
public class SpotController {
	@SuppressWarnings("unchecked")
	@RequestMapping("/add.html")
	public String add(Model model){
		JSONArray json = new JSONArray();
		JSONObject d1 = new JSONObject();
		d1.put("name","과장");
		d1.put("empCount", new Integer(2));
		json.add(d1);
		JSONObject d2 = new JSONObject();
		d2.put("name","대리");
		d2.put("empCount", new Integer(5));
		json.add(d2);
		
		model.addAttribute("list", json.toJSONString());
		model.addAttribute("delComment", "수정/삭제할 직위를 선택하세요.");
		model.addAttribute("modComment", "직위명을 수정하세요.");
		model.addAttribute("inputComment", "직위명을 입력하세요.");
		model.addAttribute("delFailComment", "사원이 등록된 직위는 삭제할 수 없습니다.");
		model.addAttribute("title", "직위 등록");
		return "commons/add.tiles";
	}
}
