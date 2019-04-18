package com.bny.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bny.dao.UserDao;
import com.bny.dto.User;
import com.bny.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public int insertUser(User user) throws Exception {
		int result = userDao.insertUser(user);
		return result;
	}

	
}
