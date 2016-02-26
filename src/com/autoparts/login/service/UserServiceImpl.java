package com.autoparts.login.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.autoparts.login.dao.UserDao;
import com.autoparts.login.model.UserDto;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	
	@Override
	public int idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return userDao.idCheck(id);
	}

	@Override
	public void registerUser(UserDto userDto) throws Exception {
		//memberDao.registerMember(memberDto);
		userDao.registerUser(userDto);
	}

	@Override
	public UserDto login(String id, String pass) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", id);
		map.put("userpwd", pass);
		return userDao.login(map);
	}
	
	@Override
	public ArrayList<UserDto> getNation() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertUserInfo(UserDto userDto) throws Exception {
		userDao.insertUserInfo(userDto);
	}

	@Override
	public UserDto getUserInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return userDao.getUserInfo(id);
	}

}
