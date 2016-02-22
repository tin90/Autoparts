package com.autoparts.mobile.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.autoparts.mobile.model.MobileDto;
import com.autoparts.mobile.service.MobileService;

@Controller
@RequestMapping("/mobile")
public class MobileController {
	
	@Autowired
	private MobileService mobileService;
	
	@RequestMapping(value="/part_search", method = RequestMethod.GET)
	public @ResponseBody String prod_search(String part){
		
		List<MobileDto> list = mobileService.prod_search(part);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for(MobileDto dto : list){
			JSONObject obj = new JSONObject();
			obj.put("part", dto.getPart());
			obj.put("brand", dto.getBrand());
			obj.put("order_qty", dto.getOrder_qty());
			obj.put("pocode", dto.getPocode());
			
			jarray.add(obj);
			
		}
		json.put("part", jarray);
				
		return json.toJSONString();
	}
	
	@RequestMapping(value="/po_list", method=RequestMethod.GET)
	public @ResponseBody String bill_list(){
		
		List<MobileDto> list = mobileService.bill_list();
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for(MobileDto dto : list){
			
			JSONObject obj = new JSONObject();
			
			obj.put("pocode", dto.getPocode());
			jarray.add(obj);
			
		}
		json.put("po_list", jarray);
		return json.toJSONString();
	}
	
	@RequestMapping(value="/po_detail", method=RequestMethod.GET)
	public @ResponseBody String bill_detail(String pocode){
		
		//search contains pocode
		List<MobileDto> list = mobileService.bill_detail(pocode);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for(MobileDto dto : list){
			JSONObject obj = new JSONObject();
			obj.put("part", dto.getPart());
			obj.put("brand", dto.getBrand());
			obj.put("qty", dto.getQty());
			obj.put("order_qty", dto.getOrder_qty());
			
			jarray.add(obj);
		}
		json.put("po_detail", jarray);
		return json.toJSONString();
	}
	
	@RequestMapping(value="/store", method=RequestMethod.GET)
	public @ResponseBody String store(MobileDto mobileDto){

		//update code,quantity   but! if it is null, insert
		mobileService.store(mobileDto);
		return "store";
	}
	
	@RequestMapping(value="/release", method=RequestMethod.GET)
	public @ResponseBody String release(MobileDto mobileDto){
		
		//update code, quantity
		mobileService.release(mobileDto);
		return "release";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public @ResponseBody String update(MobileDto mobileDto){
		
		mobileService.update(mobileDto);
		return "update";
	}
	
	@RequestMapping(value="/recent", method=RequestMethod.GET)
	public @ResponseBody String recent(){
		
		List<MobileDto> list = mobileService.recent();
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for(MobileDto dto : list){
			JSONObject obj = new JSONObject();

			obj.put("part", dto.getPart());
			obj.put("brand", dto.getBrand());
			obj.put("pocode", dto.getPocode());
			obj.put("qty", dto.getQty());
			obj.put("inout", dto.getInout());
			obj.put("date", dto.getDate());
			
			jarray.add(obj);
		}
		json.put("recent", jarray);
		return json.toJSONString();
	}
	
	@RequestMapping(value="/keeplist", method=RequestMethod.GET)
	public @ResponseBody String keeplist(){
		
		List<MobileDto> list = mobileService.keep();
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for(MobileDto dto : list){
			JSONObject obj = new JSONObject();
			obj.put("part", dto.getPart());
			obj.put("pocode", dto.getPocode());
			obj.put("order_qty", dto.getOrder_qty());
			obj.put("mod_qty", dto.getMod_qty());
			
			jarray.add(obj);
		}
		json.put("keep", jarray);
		return json.toJSONString();
	}
	
	@RequestMapping(value="/confirm", method=RequestMethod.GET)
	public @ResponseBody String confirm(){
		
		
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		
		mobileService.confirm();
		
		return "confirm";
	}
	
	@RequestMapping(value="/keep", method=RequestMethod.GET)
	public @ResponseBody String keep(){
		
		return "keep";
	}
	
	
}
