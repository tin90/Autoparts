package com.autoparts.login.service;

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
}
