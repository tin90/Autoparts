package com.autoparts.erp.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.autoparts.erp.model.ErpDto;
import com.autoparts.erp.service.ErpService;
import com.autoparts.mobile.model.MobileDto;

@Controller
@RequestMapping("/erp")
public class ErpController {

	@Autowired
	private ErpService erpService;
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public @ResponseBody String test(ErpDto erpDto){
		
		return erpService.test(erpDto);
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public @ResponseBody String search(String partnum){

		List<ErpDto> list = erpService.search(partnum);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for(ErpDto dto : list){
			JSONObject obj = new JSONObject();
			obj.put("partnum", dto.getPartnum());
			obj.put("brand", dto.getBrand());
			obj.put("net", dto.getNet());
			obj.put("description", dto.getDescription());
			obj.put("country", dto.getCountry());
			jarray.add(obj);
			
		}
		json.put("list", jarray);
		return json.toJSONString();
	}
	
	@RequestMapping(value="/cart", method=RequestMethod.GET)
	public String cart(){
		
		return "erp/cart.tiles";		
	}
	
	@RequestMapping(value="/add_cart", method=RequestMethod.POST)
	public void add_cart(ErpDto erpDto, String id){
		
		
		System.out.println(erpDto.getPartnum());
		System.out.println(erpDto.getCountry());
		System.out.println(erpDto.getQty());
		System.out.println(erpDto.getNet());
		
	}
	
}
