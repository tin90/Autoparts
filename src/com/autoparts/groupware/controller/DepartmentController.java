package com.autoparts.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		model.addAttribute("inputComment", "�μ����� �Է��ϼ���.");
		model.addAttribute("delFailComment", "����� ��ϵ� �μ��� ������ �� �����ϴ�.");
		model.addAttribute("title", "�μ� ���");
		return "commons/add.tiles";
	}
}
