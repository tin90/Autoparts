package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<String> getId(){
		return sqlSession.selectList("test.getId");
	}
}
