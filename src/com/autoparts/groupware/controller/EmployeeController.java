package com.autoparts.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@RequestMapping("/list.html")
	public String list(Model model){
		model.addAttribute("title", "»ç¿ø");
		return "employee/list.tiles";
	}
}
