package com.autoparts.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	@RequestMapping("/main.html")
	public String register(Model model){
		return "main/main.tiles";
	}
}
