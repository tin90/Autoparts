package com.autoparts.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	@RequestMapping("/error404.html")
	public String error404(Model model){
		model.addAttribute("title", "404 Not Found page");
		return "error/error404.tiles";
	}
}
