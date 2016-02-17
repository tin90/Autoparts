package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.DeptCategoryDto;
import com.autoparts.groupware.model.RawDeptDto;

@Repository
public class DeptDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<DeptCategoryDto> getCategory(){
		return sqlSession.selectList("dept.getCategory");
	}
	
	public DeptCategoryDto getCategory(int num){
		return sqlSession.selectOne("dept.getCategoryOne");
	}
	
	public void addDept(String name){
		sqlSession.insert("dept.addDept", name);
	}
	
	public void modDept(RawDeptDto dept){
		sqlSession.update("dept.modDept", dept);
	}
	
	public void delDept(int num){
		sqlSession.delete("dept.delDept", num);
	}
}
