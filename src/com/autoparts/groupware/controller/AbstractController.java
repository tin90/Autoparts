package com.autoparts.groupware.controller;

import javax.servlet.http.HttpSession;

public class AbstractController {
	public String auth(HttpSession session, int slevel, int elevel){
		String level = (String)session.getAttribute("c_level");
		if(level == null){
			//���� ����
			return "error404";
		}
		
		int c_level = Integer.parseInt(level);
		if(slevel > c_level || c_level > elevel){
			//���� ����
			return "error404";
		}
		
		return null;
	}
}
