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
}
