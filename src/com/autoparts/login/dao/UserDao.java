package com.autoparts.login.dao;

import com.autoparts.login.model.UserDto;

public interface UserDao {
	int idCheck(String id) throws Exception;
	void registerUser(UserDto userDto) throws Exception;
}
