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
		model.addAttribute("delComment", "����/������ ������ �����ϼ���.");
		model.addAttribute("modComment", "�������� �����ϼ���.");
		model.addAttribute("delFailComment", "����� ��ϵ� ������ ������ �� �����ϴ�.");
		model.addAttribute("title", "���� ���");
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
