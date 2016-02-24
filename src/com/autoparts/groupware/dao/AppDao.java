package com.autoparts.groupware.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.AppLineDto;

@Repository
public class AppDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void addAppLine(AppLineDto dto){
		sqlSession.insert("app.addAppline", dto);
		sqlSession.insert("app.addApplist", dto);
	}
}
