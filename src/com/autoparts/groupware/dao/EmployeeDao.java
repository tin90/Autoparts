package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.EmployeeDto;
import com.autoparts.groupware.model.RawEmpDto;

@Repository
public class EmployeeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public EmployeeDto getEmployee(int num){
		return sqlSession.selectOne("emp.getEmp", num);
	}
	
	public List<EmployeeDto> getEmployee(){
		return sqlSession.selectList("emp.getEmpList");
	}
	
	public void addEmp(RawEmpDto emp){
		sqlSession.insert("emp.addEmp", emp);
	}
	
	public void modEmp(RawEmpDto emp){
		sqlSession.update("emp.modEmp", emp);
	}
	
	public void delEmp(int num){
		sqlSession.delete("emp.delEmp", num);
	}
}
