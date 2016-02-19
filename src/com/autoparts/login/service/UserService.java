package com.autoparts.login.service;

import com.autoparts.login.model.UserDto;

public interface UserService{
	int idCheck(String id) throws Exception;
	void registerUser(UserDto userDto) throws Exception;
}
