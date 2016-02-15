package com.autoparts.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.autoparts.groupware.service.TestService;

@Controller
public class IndexController {
	@Autowired
	private TestService tService;
	
	@RequestMapping("index.html")
	public String index(Model model){
		tService.getId();
		
		model.addAttribute("title", "¿Œµ¶Ω∫");
		return "index.tiles";
	}
}
