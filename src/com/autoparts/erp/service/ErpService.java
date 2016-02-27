package com.autoparts.erp.service;

import java.util.List;

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
	
	
	
}
