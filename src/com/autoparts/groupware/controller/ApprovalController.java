package com.autoparts.groupware.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.autoparts.groupware.model.EmployeeDto;
import com.autoparts.groupware.model.RawAppClientDto;
import com.autoparts.groupware.model.RawEmpDto;
import com.autoparts.groupware.service.AppService;
import com.autoparts.groupware.service.EmpService;

/***
 * 
 * @author 내 문서
 * 전자결재 관련
 *
 */
@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired
	private AppService service;
	
	@Autowired
	private EmpService eservice;
	
	@RequestMapping("/admin.html")
	public String admin(Model model){
		model.addAttribute("title", "관리자");
		return "approval/admin.tiles";
	}
	
	@RequestMapping("/ajax_appclient.html")
	public @ResponseBody String ajax_appclient(String type, Integer page){
		if(type == null){
			type = "disable";
		}
		
		if(page == null){
			page = 1;
		}
		
		if(type.equals("all")){
			return service.getAll(page);
		}else if(type.equals("able")){
			return service.getAbledAll(page);
		}else{
			return service.getDisabledAll(page);
		}
	}
	
	@RequestMapping("/ajax_appclient_count.html")
	public @ResponseBody String ajax_appclient_count(String type){
		if(type == null){
			type = "disable";
		}
		
		if(type.equals("all")){
			return service.getAllPageCount();
		}else if(type.equals("able")){
			return service.getAbledAllPageCount();
		}else{
			return service.getDisabledAllPageCount();
		}
	}
	
	@RequestMapping("/ajax_appclient_reg.html")
	public @ResponseBody String ajax_appclient_reg(String json){
		JSONParser parser = new JSONParser();
		try {
			JSONObject obj = (JSONObject)parser.parse(json);
			RawEmpDto emp = new RawEmpDto();
			emp.setDept((int)(long)(Long)obj.get("dept"));
			emp.setSpot((int)(long)(Long)obj.get("spot"));
			emp.setName((String)obj.get("name"));
			eservice.addEmp(emp);
			
			RawAppClientDto app = new RawAppClientDto();
			app.setEmpno(emp.getNum());
			app.setId((String)obj.get("id"));
			service.addAppclient(app);
		} catch (Exception e) {
			return "error : "+e.getMessage();
		}
		return "ok";
	}
	
	@RequestMapping("/ajax_appclient_mod.html")
	public @ResponseBody String ajax_appclient_mod(String json){
		JSONParser parser = new JSONParser();
		try {
			JSONObject obj = (JSONObject)parser.parse(json);
			RawEmpDto emp = new RawEmpDto();
			emp.setNum((int)(long)(Long)obj.get("no"));
			emp.setDept((int)(long)(Long)obj.get("dept"));
			emp.setSpot((int)(long)(Long)obj.get("spot"));
			emp.setName((String)obj.get("name"));
			eservice.modEmp(emp);
		} catch (Exception e) {
			return "error : "+e.getMessage();
		}
		return "ok";
	}
	
	@RequestMapping("/ajax_appclient_del.html")
	public @ResponseBody String ajax_appclient_del(String json){
		JSONParser parser = new JSONParser();
		try {
			JSONObject obj = (JSONObject)parser.parse(json);
			int no = (int)(long)(Long)obj.get("no");
			service.delAppclient(no);
			eservice.delEmp(no);
		} catch (Exception e) {
			return "error : "+e.getMessage();
		}
		return "ok";
	}
	
	@RequestMapping("/app.html")
	public String app(Model model, HttpSession session){
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			return "redirect:/error404.html";
		}
		
		EmployeeDto emp = service.getEmp(id);
		
		if(emp == null){
			return "redirect:/error404.html";
		}else{
			model.addAttribute("na", service.getAppconByApplineJson(1, 1, emp.getNum()));
			model.addAttribute("title", "전자결재 메인");
			return "approval/app.tiles";
		}
	}
	
	@RequestMapping("/add.html")
	public String add(Model model, HttpSession session){
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			return "redirect:/error404.html";
		}
		
		EmployeeDto emp = service.getEmp(id);
		
		if(emp == null){
			return "redirect:/error404.html";
		}else{
			model.addAttribute("emp", emp);
			model.addAttribute("title", "전자결재 작성");
			return "approval/add_doc.tiles";
		}
	}
	
	@RequestMapping("/add_proc.html")
	public String add_proc(String json, HttpSession session){
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			return "redirect:/error404.html";
		}
		
		EmployeeDto emp = service.getEmp(id);
		
		if(emp == null){
			return "redirect:/error404.html";
		}
		
		service.addAppcontent(json, emp.getNum());
		return "redirect:/approval/app.html";
	}
	
	@RequestMapping("/read.html")
	public String read(Model model, HttpSession session, Integer num){
		if(num == null){
			return "redirect:/approval/app.html";
		}
		
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			return "redirect:/error404.html";
		}
		
		EmployeeDto emp = service.getEmp(id);
		
		if(emp == null){
			return "redirect:/error404.html";
		}else{
			model.addAttribute("emp", emp);
			model.addAttribute("num", num);
			model.addAttribute("title", "전자결재 작성");
			return "approval/read_doc.tiles";
		}
	}
	
	@RequestMapping("/ajax_read.html")
	public @ResponseBody String ajax_read(int num){
		return service.getAppconJson(num);
	}
	
	@RequestMapping("/list.html")
	public String list(Model model, String page, String state, Integer empno){
		if(page == null){
			page = "";
		}
		
		if(state == null){
			state = "";
		}
		
		if(empno == null){
			model.addAttribute("url", "/ajax_list.html?page="+page+"&state="+state);
		}else{
			model.addAttribute("url", "/ajax_list_appline.html?page="+page+"&state="+state+"&empno="+empno);
		}
	
		model.addAttribute("title", "결재문서");
		return "approval/list_doc.tiles";
	}
	
	@RequestMapping("/ajax_list.html")
	public @ResponseBody String ajax_list(Integer page, Integer state){
		if(page == null){
			page = 1;
		}
		
		if(state == null){
			state = 1;
		}
		
		return service.getAppconList(page, state);
	}
	
	@RequestMapping("/ajax_list_appline.html")
	public @ResponseBody String ajax_list_appline(Integer page, Integer state, Integer empno){
		if(page == null){
			page = 1;
		}
		
		if(state == null){
			state = 1;
		}
		
		return service.getAppconByApplineJson(page, state, empno);
	}
}
