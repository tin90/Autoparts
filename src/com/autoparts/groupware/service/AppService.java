package com.autoparts.groupware.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.AppDao;
import com.autoparts.groupware.model.AppLineDto;

@Service
public class AppService {
	@Autowired
	private AppDao dao;
	
	public void addAppLine(AppLineDto dto){
		dao.addAppLine(dto);
	}
}
