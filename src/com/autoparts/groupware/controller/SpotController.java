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
		d1.put("name","����");
		d1.put("empCount", new Integer(2));
		json.add(d1);
		JSONObject d2 = new JSONObject();
		d2.put("name","�븮");
		d2.put("empCount", new Integer(5));
		json.add(d2);
		
		model.addAttribute("list", json.toJSONString());
		model.addAttribute("delComment", "����/������ ������ �����ϼ���.");
		model.addAttribute("modComment", "�������� �����ϼ���.");
		model.addAttribute("inputComment", "�������� �Է��ϼ���.");
		model.addAttribute("delFailComment", "����� ��ϵ� ������ ������ �� �����ϴ�.");
		model.addAttribute("title", "���� ���");
		return "commons/add.tiles";
	}
}
