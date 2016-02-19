package com.autoparts.login.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.login.model.UserDto;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int idCheck(String id) throws Exception {
		System.out.println("test2");
		return (int) sqlSession.selectOne("idcheck", id);
	}

	@Override
	public void registerUser(UserDto userDto) throws Exception {
		// sqlMapClient.update("register",memberDto);
		sqlSession.insert("register", userDto);
		
	}
	
}
