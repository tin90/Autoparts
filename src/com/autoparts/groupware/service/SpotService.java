package com.autoparts.groupware.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.SpotDao;
import com.autoparts.groupware.model.SpotCategoryDto;

@Service
public class SpotService {
	@Autowired
	private SpotDao dao;
	
	@SuppressWarnings("unchecked")
	public String getCategory(){
		JSONArray json = new JSONArray();
		JSONObject obj;
		
		for(SpotCategoryDto cate : dao.getCategory()){
			obj = new JSONObject();
			obj.put("no", cate.getNo());
			obj.put("name", cate.getName());
			obj.put("count", cate.getEmpCount());
			json.add(obj);
		}
		
		return json.toJSONString();
	}
}
