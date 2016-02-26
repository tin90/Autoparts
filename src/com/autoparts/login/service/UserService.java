package com.autoparts.login.service;

import java.util.ArrayList;

import com.autoparts.login.model.UserDto;

public interface UserService{
	int idCheck(String id) throws Exception;
	void registerUser(UserDto userDto) throws Exception;
	UserDto login(String id, String pass) throws Exception;
	ArrayList<UserDto> getNation() throws Exception;
	void insertUserInfo(UserDto userDto) throws Exception;
	UserDto getUserInfo(String id) throws Exception;
}
