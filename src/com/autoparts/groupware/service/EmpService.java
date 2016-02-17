package com.autoparts.groupware.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.groupware.dao.EmployeeDao;
import com.autoparts.groupware.model.EmployeeDto;
import com.autoparts.groupware.model.RawEmpDto;

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
	
	public void addEmp(RawEmpDto emp){
		dao.addEmp(emp);
	}
	
	public void modEmp(RawEmpDto emp){
		dao.modEmp(emp);
	}
	
	public void delEmp(int num){
		dao.delEmp(num);
	}
}
