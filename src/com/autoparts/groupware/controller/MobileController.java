package com.autoparts.groupware.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.autoparts.groupware.dao.MobileDao;
import com.autoparts.groupware.model.MobileDto;

@Controller
@RequestMapping("/mobile")
public class MobileController {
	
	@Autowired
	private MobileDao mobileDao;
	
	@RequestMapping(value="/prod_search", method = RequestMethod.GET)
	public @ResponseBody String prod_search(String prod_code){
		
		MobileDto result = mobileDao.prod_search(prod_code);
		JSONObject json = new JSONObject();
		json.put("prod", result);
				
		return json.toJSONString();
	}
	
	@RequestMapping(value="/bill_list", method=RequestMethod.GET)
	public @ResponseBody String bill_list(){
		
		//search date+billcode
		MobileDto result = mobileDao.bill_list();
		JSONObject json = new JSONObject();
		json.put("bill_list", "result");
		return json.toJSONString();
	}
	
	@RequestMapping(value="/bill_detail", method=RequestMethod.GET)
	public @ResponseBody String bill_detail(String bill_code){
		
		//search contains bill_code
		mobileDao.bill_detail(bill_code);
		JSONObject json = new JSONObject();
		json.put("bill_detail", "result");
		return json.toJSONString();
	}
	
	@RequestMapping(value="/store", method=RequestMethod.GET)
	public @ResponseBody String store(MobileDto mobileDto){

		//update code,quantity   but! if it is null, insert
		mobileDao.store(mobileDto);
		return "store";
	}
	
	@RequestMapping(value="/release", method=RequestMethod.GET)
	public @ResponseBody String release(MobileDto mobileDto){
		
		//update code, quantity
		mobileDao.release(mobileDto);
		return "release";
	}
	
}
