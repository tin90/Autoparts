package com.autoparts.groupware.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.autoparts.groupware.model.EmployeeDto;
import com.autoparts.groupware.service.EmpService;

@Controller
public class IndexController {
	@Autowired
	EmpService service;
	
	@RequestMapping("index.html")
	public String index(Model model){
		System.out.println(service.getName());
		
		model.addAttribute("title", "¿Œµ¶Ω∫");
		return "index.tiles";
	}
}
