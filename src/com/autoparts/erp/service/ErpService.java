package com.autoparts.erp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.erp.dao.ErpDao;
import com.autoparts.erp.model.ErpDto;

@Service
public class ErpService {

	@Autowired
	private ErpDao erpDao;

	public String test(ErpDto erpDto) {
		
		return erpDao.test(erpDto);
		
	}

	public List<ErpDto> search(String partnum) {
		return erpDao.search(partnum);
	}

	public void add_cart(ErpDto erpDto) {
		erpDao.add_cart(erpDto);
	}

	public List<ErpDto> cart(String id) {
		return erpDao.cart(id);
	}

	public void del_cart(ErpDto erpDto) {
		erpDao.del_cart(erpDto);
	}

	public void send_Cart(ErpDto erpDto) {
		erpDao.send_cart(erpDto);
	}

	public void mod_qty(ErpDto erpDto) {
		erpDao.mod_qty(erpDto);
	}

	public void excel_cart(List list){
		erpDao.excel_cart(list);
	}

	public List<ErpDto> menu_dealer(ErpDto erpDto) {
		return erpDao.menu_dealer(erpDto);
	}
	
	
	
}
