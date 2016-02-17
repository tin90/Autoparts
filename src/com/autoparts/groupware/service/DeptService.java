package com.autoparts.groupware.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.DeptDao;
import com.autoparts.groupware.model.DeptCategoryDto;

@Service
public class DeptService {
	@Autowired
	private DeptDao dao;
	
	@SuppressWarnings("unchecked")
	public String getCategory(){
		JSONArray json = new JSONArray();
		JSONObject obj;
		
		for(DeptCategoryDto cate : dao.getCategory()){
			obj = new JSONObject();
			obj.put("no", cate.getNo());
			obj.put("name", cate.getName());
			obj.put("count", cate.getEmpCount());
			json.add(obj);
		}
		
		return json.toJSONString();
	}
}
