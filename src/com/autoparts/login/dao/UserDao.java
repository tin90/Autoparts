package com.autoparts.login.dao;

import java.util.Map;

import com.autoparts.login.model.UserDto;

public interface UserDao {
	int idCheck(String id) throws Exception;
	void registerUser(UserDto userDto) throws Exception;
	UserDto login(Map<String, String> map) throws Exception;
	UserDto getNation() throws Exception;
	void insertUserInfo(UserDto userDto) throws Exception;
	UserDto getUserInfo(String id) throws Exception;
}
