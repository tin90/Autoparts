package com.autoparts.login.controller;

import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String register(Model model, HttpSession session){
		return "join/join";
	}
	@RequestMapping("/joinInfo.html")
	public ModelAndView registerInfo(HttpSession session) throws Exception{
		System.out.println((String)session.getAttribute("id"));
		userDto =userService.getUserInfo((String)session.getAttribute("id"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("userInfo", userDto);
		System.out.println("test-----");
		mav.setViewName("join/joinInfo");
		return mav;
	}
	@RequestMapping(value="/register.html", method=RequestMethod.POST)
	public ModelAndView register(UserDto userDto, HttpSession session) throws Exception{
		userDto.setC_level("100");
		userService.registerUser(userDto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("registerInfo", userDto);
		mav.setViewName("join/registerok");
		session.invalidate();
		return mav;
	}
	@RequestMapping(value="/login.html", method=RequestMethod.POST)
	public String login(String id, String pwd, HttpSession session) throws Exception{
		System.out.println("id - "+ id+ "    pass - " + pwd);
		userDto = userService.login(id, pwd);
		System.out.println(userDto);
		if(userDto != null){
			System.out.println("test");
			session.setAttribute("userInfo", userDto);
			session.setAttribute("id",userDto.getId());
			session.setAttribute("c_level", userDto.getC_level());
		}
		System.out.println("finish");
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
	
	
	@RequestMapping("/email.html")
	public ModelAndView emailAuth(String email, HttpSession session) throws Exception{
		System.out.println("/email.html      -   email " + email);
		String authNum = "";
		
		authNum = RandomNum();
		
		
		sendEmail(email.toString(), authNum);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/join/emailAuth");
		mav.addObject("email", email);
		mav.addObject("authNum", authNum);
		session.setAttribute("authNum", authNum);
		session.setAttribute("email", email);
		System.out.println(authNum);
		return mav;
	}
	
	private void sendEmail(String email, String authNum) {
		String host ="smtp.gmail.com";
		String subject = "AUTOPARTS 인증번호전달";
		String fromName = "manager";
		String from = "ejdgns89@gmail.com";
		String to1 = email;
		
		String content = "인증번호  [" + authNum + "]";
		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("email.smtp.socketFatory.class", "javax.net.ssl.SSLSoketFactory");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			System.out.println("----------------------------1");
			Session mailSession = Session.getInstance(props, 
						new Authenticator(){
							protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication("ejdgns89@gmail.com", "j1d2h31425~");
							}
				});
			System.out.println("----------------------------2");
			Message msg = new MimeMessage(mailSession);
			System.out.println("----------------------------3");
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			System.out.println("----------------------------4");
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			System.out.println("----------------------------5");
			msg.setRecipients(Message.RecipientType.TO, address1);
			System.out.println("----------------------------6");
			msg.setSubject(subject);
			System.out.println("----------------------------7");
			msg.setSentDate(new java.util.Date());
			System.out.println("----------------------------8");
			msg.setContent(content, "text/html;charset=euc-kr");
			System.out.println("----------------------------9");
			Transport.send(msg);
			System.out.println("----------------------------10");
		} catch(MessagingException e){
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=6; i++){
			int n = (int) (Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
}
	