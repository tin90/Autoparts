package com.autoparts.erp.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.erp.model.ErpDto;

@Repository
public class ErpDao {

	@Autowired
	SqlSessionTemplate sst;

	public String test(ErpDto erpDto) {
		
		return sst.selectOne("test",erpDto.getPart());
		
	}

	public List<ErpDto> search(String partnum) {
		return sst.selectList("search", partnum);
	}

	public void add_cart(ErpDto erpDto) {
		sst.update("add_cart",erpDto);
	}

	public List<ErpDto> cart(String id) {
		return sst.selectList("cart", id);
	}

	public void del_cart(ErpDto erpDto) {
		sst.delete("del_cart", erpDto);
	}

	public void send_cart(ErpDto erpDto) {
		List<ErpDto> list = sst.selectList("getcart_for_send", erpDto);
		//sst.delete("send_cart", erpDto);
		sst.insert("insert_from_cart",list);
	}

	public void mod_qty(ErpDto erpDto) {
		sst.update("mod_qty", erpDto);
	}

	public void excel_cart(List list) {
		sst.update("excel_cart", list);
	}

	public List<ErpDto> menu_dealer(ErpDto erpDto) {
		return sst.selectList("menu_dealer",erpDto);
	}
	
	
}
