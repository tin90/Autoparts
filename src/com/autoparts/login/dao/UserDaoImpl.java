package com.autoparts.login.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.autoparts.login.model.UserDto;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	private UserDto userDto;
	
	@Override
	public int idCheck(String id) throws Exception {
		//System.out.println("test2");
		return (int) sqlSession.selectOne("idcheck", id);
	}

	@Override
	public void registerUser(UserDto userDto) throws Exception {
		// sqlMapClient.update("register",memberDto);
		sqlSession.insert("register", userDto);
		
	}

	@Override
	public UserDto login(Map<String, String> map) throws Exception {
		String id = map.get("userid");
		int chkNum = sqlSession.selectOne("user.loginchk", id);
		if(chkNum == 0){
			return userDto;
		}else{
			userDto = sqlSession.selectOne("login", map);
			return userDto;
		}
	}

	@Override
	public UserDto getNation() throws Exception {
		return null;
	}

	@Override
	public void insertUserInfo(UserDto userDto) throws Exception {
		sqlSession.update("insertUserInfo", userDto);
	}
	
	@Override
	public UserDto getUserInfo(String id) throws Exception {
		userDto = sqlSession.selectOne("userInfo", id);
		return userDto;
	}
}
