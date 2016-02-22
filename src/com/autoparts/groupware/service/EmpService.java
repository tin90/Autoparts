package com.autoparts.groupware.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.EmployeeDao;
import com.autoparts.groupware.model.EmployeeDto;
import com.autoparts.groupware.model.RawEmpDto;

@Service
@SuppressWarnings("unchecked")
public class EmpService {
	@Autowired
	private EmployeeDao dao;
	
	public EmployeeDto getEmp(int num){
		return dao.getEmpOne(num);
	}
	
	public List<EmployeeDto> getEmp(){
		return dao.getEmpList();
	}
	
	public String getEmpPage(int page){
		JSONArray json = new JSONArray();
		JSONObject obj;
		
		for(EmployeeDto emp : dao.getEmpPage(page)){
			obj = new JSONObject();
			obj.put("num", emp.getNum());
			obj.put("dept", emp.getDept());
			obj.put("spot", emp.getSpot());
			obj.put("name", emp.getName());
			json.add(obj);
		}
		
		return json.toJSONString();
	}
	
	public String getEmpPage(String search, int page, int q){
		JSONArray json = new JSONArray();
		JSONObject obj;
		
		for(EmployeeDto emp : dao.getEmpPage(search, page, q)){
			obj = new JSONObject();
			obj.put("num", emp.getNum());
			obj.put("dept", emp.getDept());
			obj.put("spot", emp.getSpot());
			obj.put("name", emp.getName());
			json.add(obj);
		}
		
		return json.toJSONString();
	}
	
	public String getPageCount(String search){
		JSONObject obj = new JSONObject();
		obj.put("count", dao.getPageCount(search));
		return obj.toJSONString();
	}
	
	public void addEmp(RawEmpDto emp){
		dao.addEmp(emp);
	}
	
	public void modEmp(RawEmpDto emp){
		dao.modEmp(emp);
	}
	
	public String delEmp(String json){
		try {
			JSONParser parser = new JSONParser();
			
			JSONArray obj = (JSONArray)parser.parse(json);
			int size = obj.size();
			for(int i = 0; i < size; i++){
				int num = (int)(long)(Long)obj.get(i);
				dao.delEmp(num);
			}
		} catch (Exception e) {
			return "error : " + e.getMessage();
		}
		return "ok";
	}
}
