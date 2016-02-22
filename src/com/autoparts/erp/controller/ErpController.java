package com.autoparts.erp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.autoparts.erp.model.ErpDto;
import com.autoparts.erp.service.ErpService;

@Controller
@RequestMapping("/erp")
public class ErpController {

	@Autowired
	private ErpService erpService;
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public @ResponseBody String test(ErpDto erpDto){
		
		return erpService.test(erpDto);
	}
	
}
