package com.autoparts.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.TestDao;

@Service
public class TestService {
	@Autowired
	private TestDao dao;
	
	public List<String> getId(){
		return dao.getId();
	}
}
