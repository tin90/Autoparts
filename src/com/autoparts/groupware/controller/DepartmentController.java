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
		model.addAttribute("delComment", "����/������ �μ��� �����ϼ���.");
		model.addAttribute("modComment", "�μ����� �����ϼ���.");
		model.addAttribute("delFailComment", "����� ��ϵ� �μ��� ������ �� �����ϴ�.");
		model.addAttribute("ajax", "./ajax_add.html");
		model.addAttribute("title", "�μ� ���");
		return "commons/add.tiles";
	}
	
	@RequestMapping("/ajax_add.html")
	public @ResponseBody String ajax_add(String json){
		System.out.println(json);
		return service.ajax(json);
	}
}
