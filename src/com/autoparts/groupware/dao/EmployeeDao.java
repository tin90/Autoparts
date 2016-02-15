package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.autoparts.groupware.model.EmployeeDto;

public class EmployeeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<EmployeeDto> getEmployee(){
		return sqlSession.selectList("test.getId");
	}
}
