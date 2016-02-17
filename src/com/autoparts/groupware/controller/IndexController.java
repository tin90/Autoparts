package com.autoparts.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("index.html")
	public String index(Model model){
		model.addAttribute("title", "¿Œµ¶Ω∫");
		return "index.tiles";
	}
}
