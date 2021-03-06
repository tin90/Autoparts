package com.autoparts.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.autoparts.groupware.service.SpotService;

@Controller
@RequestMapping("/spot")
public class SpotController {
	@Autowired
	private SpotService service;
	
	@RequestMapping("/add.html")
	public String add(Model model){
		model.addAttribute("delComment", "수정/삭제할 직위를 선택하세요.");
		model.addAttribute("modComment", "직위명을 수정하세요.");
		model.addAttribute("delFailComment", "사원이 등록된 직위는 삭제할 수 없습니다.");
		model.addAttribute("title", "직위 등록");
		return "commons/add.tiles";
	}
	
	@RequestMapping(value="/ajax_list.html", produces="application/json;charset=utf-8")
	public @ResponseBody String ajax_list(){
		return service.getCategory();
	}
	
	@RequestMapping(value="/ajax_add.html", produces="application/text;charset=utf-8")
	public @ResponseBody String ajax_add(String json){
		return service.ajax(json);
	}
}
