package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.EmployeeDto;

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
	
	public String getName(){
		String s = sqlSession.selectOne("emp.test");
		System.out.println("dao : "+s);
		return s;
	}
}
