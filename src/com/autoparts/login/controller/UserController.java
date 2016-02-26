package com.autoparts.login.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	UserDto userDto;
	
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
	public ModelAndView registerInfo(HttpSession session) throws Exception{
		userDto =userService.getUserInfo((String)session.getAttribute("id"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("userInfo", userDto);
		System.out.println("test-----");
		System.out.println(userDto.getName());
		System.out.println(userDto.getReq());
		mav.setViewName("join/joinInfo");
		return mav;
	}
	@RequestMapping(value="/register.html", method=RequestMethod.POST)
	public ModelAndView register(UserDto userDto) throws Exception{
		userDto.setC_level("100");
		userService.registerUser(userDto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("registerInfo", userDto);
		mav.setViewName("join/registerok");
		return mav;
	}
	@RequestMapping(value="/login.html", method=RequestMethod.POST)
	public String login(String id, String pwd, HttpSession session) throws Exception{
		System.out.println("id - "+ id+ "    pass - " + pwd);
		userDto = userService.login(id, pwd);
		session.setAttribute("userInfo", userDto);
		session.setAttribute("id", userDto.getId());
		session.setAttribute("c_level", userDto.getC_level());
		return "join/loginok";
	}
	@RequestMapping(value="/logout.html")
	public String logout(HttpSession session){
		session.removeAttribute("userInfo");
		return "join/logout";
	}
	
	@RequestMapping(value="/getNation.html")
	public ModelAndView getNation(HttpSession session){
		System.out.println();
		ModelAndView mav = new ModelAndView();
		ArrayList<UserDto> list = null;
		try {
			list = userService.getNation();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.setViewName("getMdeptselet");
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping(value="/registerInfo.html", method=RequestMethod.POST)
	public String registerInfo(UserDto userDto, HttpSession session) throws Exception{
		System.out.println("companyRegisterInfo!!!!!!");
		userDto.setId((String)session.getAttribute("id"));
		if(userDto.getReq() == null){
			System.out.println("test");
			userDto.setReq("");
		}
		userService.insertUserInfo(userDto);
		return "main/main.tiles";
	}
}
	