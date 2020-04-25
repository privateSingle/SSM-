package com.zw.admin.server.service;

import com.zw.admin.server.dto.UserDto;
import com.zw.admin.server.model.User;

import java.util.List;

public interface UserService {

	User saveUser(UserDto userDto);
	
	User updateUser(UserDto userDto);

	String passwordEncoder(String credentials, String salt);

	User getUser(String username);

	List<User> getUserListToJzId(String jzId);

	void changePassword(String username, String oldPassword, String newPassword);

}
