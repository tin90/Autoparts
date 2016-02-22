package com.autoparts.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/***
 * 
 * @author �� ����
 * ���ڰ��� ����
 *
 */
@Controller
@RequestMapping("/approval")
public class ApprovalController {

	@RequestMapping("/app.html")
	public String app(Model model){
		model.addAttribute("title", "���ڰ��� ����");
		return "approval/app.tiles";
	}
	
	@RequestMapping("/add.html")
	public String add(Model model){
		model.addAttribute("title", "���ڰ��� �ۼ�");
		return "approval/add_doc.tiles";
	}
	
	@RequestMapping("/read.html")
	public String read(Model model){
		model.addAttribute("title", "���ڰ��� �ۼ�");
		return "approval/read_doc.tiles";
	}
	
	@RequestMapping("/list.html")
	public String list(Model model){
		model.addAttribute("title", "���繮��");
		return "approval/list_doc.tiles";
	}
}
