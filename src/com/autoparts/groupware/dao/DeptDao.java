package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.DeptCategoryDto;

@Repository
public class DeptDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<DeptCategoryDto> getCategory(){
		return sqlSession.selectList("dept.getCategory");
	}
}
