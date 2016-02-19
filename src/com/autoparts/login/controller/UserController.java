package com.autoparts.login.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.autoparts.login.model.UserDto;
import com.autoparts.login.service.UserService;

@Controller
@RequestMapping("/join")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/idCheck.html")
	public @ResponseBody String idCheck(String sid) throws Exception{
		System.out.println("test1");
		int cnt = userService.idCheck(sid);
		JSONObject json = new JSONObject();
		json.put("idcount", cnt);
		return json.toJSONString();
	}
	@RequestMapping("/join.html")
	public String register(Model model){
		return "join/join";
	}
	@RequestMapping("/joinInfo.html")
	public String registerInfo(Model model){
		return "join/joinInfo";
	}
	@RequestMapping(value="/register.html", method=RequestMethod.POST)
	public ModelAndView register(UserDto userDto) throws Exception{
		userService.registerUser(userDto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("registerInfo", userDto);
		mav.setViewName("join/registerok");
		return mav;
	}
	
	
	
}
	