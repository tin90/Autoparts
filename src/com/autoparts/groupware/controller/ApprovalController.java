package com.autoparts.groupware.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.autoparts.groupware.service.AppService;

/***
 * 
 * @author �� ����
 * ���ڰ��� ����
 *
 */
@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired
	private AppService service;
	
	@RequestMapping("/admin.html")
	public String admin(Model model){
		model.addAttribute("title", "������");
		return "approval/admin.tiles";
	}
	
	@RequestMapping("/ajax_appclient.html")
	public @ResponseBody String ajax_appclient(Model model, String type){
		if(type == null){
			return service.getDisabledAll();
		}else if(type.equals("all")){
			return service.getAll();
		}else if(type.equals("able")){
			return service.getAbledAll();
		}else if(type.equals("disable")){
			return service.getDisabledAll();
		}else{
			return service.getDisabledAll();
		}
	}
	
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
	
	@RequestMapping("/add_proc.html")
	public String add_proc(String json, String state, HttpSession session){
		if(state == null){
			return "redirect:/error404";
		}
		
		service.addAppcontent(json, (String)session.getAttribute("id"), Integer.parseInt(state));
		return "redirect:/approval/app.html";
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
