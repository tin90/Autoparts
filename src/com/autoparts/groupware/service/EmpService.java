package com.autoparts.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.EmployeeDao;
import com.autoparts.groupware.model.EmployeeDto;

@Service
public class EmpService {
	@Autowired
	private EmployeeDao dao;
	
	public EmployeeDto getEmp(int num){
		return dao.getEmployee(num);
	}
	
	public List<EmployeeDto> getEmp(){
		return dao.getEmployee();
	}
	
	public String getName(){
		return dao.getName();
	}
}
