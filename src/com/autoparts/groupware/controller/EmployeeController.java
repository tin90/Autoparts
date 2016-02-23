package com.autoparts.groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.autoparts.groupware.model.RawEmpDto;
import com.autoparts.groupware.service.DeptService;
import com.autoparts.groupware.service.EmpService;
import com.autoparts.groupware.service.SpotService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	private SpotService spot;
	@Autowired
	private DeptService dept;
	@Autowired
	private EmpService emp;
	
	@RequestMapping("/list.html")
	public String list(Model model){
		model.addAttribute("title", "»ç¿ø");
		return "employee/list.tiles";
	}
	
	@RequestMapping(value="/ajax_spot_list.html", produces="application/json;charset=utf-8")
	public @ResponseBody String ajaxSpotList(){
		return spot.getCategory();
	}
	
	@RequestMapping(value="/ajax_dept_list.html", produces="application/json;charset=utf-8")
	public @ResponseBody String ajaxDeptList(){
		return dept.getCategory();
	}
	
	@RequestMapping(value="/ajax_emp_list.html", produces="application/json;charset=utf-8")
	public @ResponseBody String ajaxEmpList(String search, int page, String q){
		if(search.equals("total")){
			return emp.getEmpPage(page);	
		}else if(search.equals("name")){
			return "";
		}else{
			return emp.getEmpPage(search, page, Integer.parseInt(q));	
		}
	}
	
	@RequestMapping(value="/ajax_emp_page_count.html", produces="application/json;charset=utf-8")
	public @ResponseBody String ajaxPageCount(String search, String q){
		if(search.equals("total")){
			return emp.getPageCount(search);
		}else{
			return emp.getPageCount(search, Integer.parseInt(q));
		}
	}
	
	@RequestMapping(value="/ajax_add_emp.html", produces="application/text;charset=utf-8")
	public @ResponseBody String ajaxAddEmp(int dept, int spot, String name){
		RawEmpDto remp = new RawEmpDto();
		remp.setDept(dept);
		remp.setSpot(spot);
		remp.setName(name);
		emp.addEmp(remp);
		return "ok";
	}
	
	@RequestMapping(value="/ajax_del_emp.html", produces="application/text;charset=utf-8")
	public @ResponseBody String ajaxDelEmp(String json){
		return emp.delEmp(json);
	}
	
	@RequestMapping(value="/ajax_mod_emp.html", produces="application/text;charset=utf-8")
	public @ResponseBody String ajaxModEmp(int num, int dept, int spot, String name){
		RawEmpDto remp = new RawEmpDto();
		remp.setNum(num);
		remp.setDept(dept);
		remp.setSpot(spot);
		remp.setName(name);
		emp.modEmp(remp);
		return "ok";
	}
	
	@RequestMapping(value="/ajax_mod_dept.html", produces="application/text;charset=utf-8")
	public @ResponseBody String ajaxModDept(String json){
		System.out.println(json);
		return emp.modDept(json);
	}
	
	@RequestMapping(value="/ajax_mod_spot.html", produces="application/text;charset=utf-8")
	public @ResponseBody String ajaxModSpot(String json){
		System.out.println(json);
		return emp.modSpot(json);
	}
}
