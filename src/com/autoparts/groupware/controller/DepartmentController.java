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
		model.addAttribute("delComment", "����/������ �μ��� �����ϼ���.");
		model.addAttribute("modComment", "�μ����� �����ϼ���.");
		model.addAttribute("delFailComment", "����� ��ϵ� �μ��� ������ �� �����ϴ�.");
		model.addAttribute("title", "�μ� ���");
		return "commons/add.tiles";
	}
	
	@RequestMapping(value="/ajax_list.html")
	public @ResponseBody String ajax_list(){
		return service.getCategory();
	}
	
	@RequestMapping("/ajax_add.html")
	public @ResponseBody String ajax_add(String json){
		return service.ajax(json);
	}
}
