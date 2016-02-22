package com.autoparts.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/***
 * 
 * @author 내 문서
 * 전자결재 관련
 *
 */
@Controller
@RequestMapping("/approval")
public class ApprovalController {

	@RequestMapping("/app.html")
	public String app(Model model){
		model.addAttribute("title", "전자결재 메인");
		return "approval/app.tiles";
	}
	
	@RequestMapping("/add.html")
	public String add(Model model){
		model.addAttribute("title", "전자결재 작성");
		return "approval/add_doc.tiles";
	}
	
	@RequestMapping("/read.html")
	public String read(Model model){
		model.addAttribute("title", "전자결재 작성");
		return "approval/read_doc.tiles";
	}
	
	@RequestMapping("/list.html")
	public String list(Model model){
		model.addAttribute("title", "결재문서");
		return "approval/list_doc.tiles";
	}
}
