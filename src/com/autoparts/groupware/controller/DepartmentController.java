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
		d1.put("name","�濵������");
		d1.put("empCount", new Integer(2));
		json.add(d1);
		JSONObject d2 = new JSONObject();
		d2.put("name","������");
		d2.put("empCount", new Integer(5));
		json.add(d2);
		
		model.addAttribute("list", json.toJSONString());
		model.addAttribute("delComment", "����/������ �μ��� �����ϼ���.");
		model.addAttribute("modComment", "�μ����� �����ϼ���.");
		model.addAttribute("inputComment", "�μ����� �Է��ϼ���.");
		model.addAttribute("delFailComment", "����� ��ϵ� �μ��� ������ �� �����ϴ�.");
		model.addAttribute("title", "�μ� ���");
		return "commons/add.tiles";
	}
}
