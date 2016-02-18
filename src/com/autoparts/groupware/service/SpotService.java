package com.autoparts.groupware.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.SpotDao;
import com.autoparts.groupware.model.RawSpotDto;
import com.autoparts.groupware.model.SpotCategoryDto;

@Service
@SuppressWarnings("unchecked")
public class SpotService {
	@Autowired
	private SpotDao dao;
	
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
	
	public String ajax(String json){
		try {
			JSONParser parser = new JSONParser();
			
			JSONObject obj = (JSONObject)parser.parse(json);
			
			JSONArray add = (JSONArray)obj.get("add");
			int size = add.size();
			for(int i = 0; i < size; i++){
				dao.addSpot((String)add.get(i));
			}
			
			JSONArray mod = (JSONArray)obj.get("mod");
			size = mod.size();
			for(int i = 0; i < size; i++){
				JSONObject o = (JSONObject)mod.get(i);
				RawSpotDto dto = new RawSpotDto();
				dto.setNum((int)(long)(Long)o.get("no"));
				dto.setName((String)o.get("name"));
				
				dao.modSpot(dto);
			}
			
			JSONArray del = (JSONArray)obj.get("del");
			size = del.size();
			for(int i = 0; i < size; i++){
				dao.delSpot((int)(long)(Long)del.get(i));
			}
		} catch (Exception e) {
			return "error : " + e.getMessage();
		}
		return "ok";
	}
}
