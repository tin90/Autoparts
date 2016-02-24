package com.autoparts.groupware.service;

import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.DeptDao;
import com.autoparts.groupware.model.DeptCategoryDto;
import com.autoparts.groupware.model.RawDeptDto;

@Service
@SuppressWarnings("unchecked")
public class DeptService {
	@Autowired
	private DeptDao dao;
	
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

	public String ajax(String json){
		JSONParser parser = new JSONParser();
		try {
			JSONObject obj = (JSONObject)parser.parse(json);
			
			JSONArray del = (JSONArray)obj.get("del");
			Iterator<Integer> dList = del.iterator();
			while (dList.hasNext()) {
				dao.delDept(dList.next());
			}
			
			JSONArray add = (JSONArray)obj.get("add");
			Iterator<String> aList = add.iterator();
			while (aList.hasNext()) {
				dao.addDept(aList.next());
			}
			
			JSONArray mod = (JSONArray)obj.get("mod");
			Iterator<JSONObject> mList = mod.iterator();
			while (mList.hasNext()) {
				JSONObject o = mList.next();
				RawDeptDto dto = new RawDeptDto();
				dto.setNum((int)o.get("no"));
				dto.setName((String)o.get("name"));
				
				dao.modDept(dto);
			}
		} catch (Exception e) {
			return "error";
		}
		return "ok";
	}
}
