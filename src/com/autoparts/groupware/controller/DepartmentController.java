package com.autoparts.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.autoparts.groupware.service.DeptService;

@Controller
@RequestMapping("/department")
public class DepartmentController {
	@Autowired
	private DeptService service;
	
	@RequestMapping("/add.html")
	public String add(Model model){
		model.addAttribute("list", service.getCategory());
		model.addAttribute("delComment", "수정/삭제할 부서를 선택하세요.");
		model.addAttribute("modComment", "부서명을 수정하세요.");
		model.addAttribute("delFailComment", "사원이 등록된 부서는 삭제할 수 없습니다.");
		model.addAttribute("ajax", "./ajax_add.html");
		model.addAttribute("title", "부서 등록");
		return "commons/add.tiles";
	}
	
	@RequestMapping("/ajax_add.html")
	public @ResponseBody String ajax_add(String json){
		System.out.println(json);
		return service.ajax(json);
	}
}
