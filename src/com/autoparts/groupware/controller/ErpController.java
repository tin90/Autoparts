package com.autoparts.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/***
 * 
 * @author �� ����
 * ����, �ֹ� ��
 *
 */
@Controller
@RequestMapping("/erp")
public class ErpController {
	@RequestMapping("erp.html")
	public String f1(Model model){
		return "erp/erp.tiles";
	}
}
