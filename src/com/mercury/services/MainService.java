package com.mercury.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.User;
import com.mercury.daos.UserDao;
import com.mercury.dtos.UserInfo;

@Service
public class MainService {
	@Autowired
	private UserDao ud;
	
	//@Transactional
	public UserInfo process(User user) {
		ud.save(user);
		UserInfo userInfo = new UserInfo();;
		userInfo.setMessage("Hello " + user.getUsername() + ", welcome to YFTS!");
		userInfo.setUsers(ud.queryAll());
		return userInfo;
	}
}
