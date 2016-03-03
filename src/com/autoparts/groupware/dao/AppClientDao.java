package com.autoparts.groupware.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.groupware.model.AppClientDto;

@Repository
public class AppClientDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AppClientDto> getAll(){
		return sqlSession.selectList("appclient.getAll");
	}
	
	public List<AppClientDto> getAbledAll(){
		return sqlSession.selectList("appclient.getAbledAll");
	}
	
	public List<AppClientDto> getDisabledAll(){
		return sqlSession.selectList("appclient.getDisabledAll");
	}
}
