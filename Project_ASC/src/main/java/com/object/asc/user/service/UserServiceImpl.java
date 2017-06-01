package com.object.asc.user.service;

import java.sql.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.user.dao.UserDAO;
import com.object.asc.user.domain.User;

@Service
public class UserServiceImpl implements UserService {
   
	@Inject
	private UserDAO dao;

	@Override
	public void register(User user) {
		dao.register(user);
	}

	@Override
	public void modify(User user) {
		dao.modify(user);
	}

	@Override
	public User login(User user) {
		return dao.login(user);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date sessionLimit) {
		dao.keepLogin(id, sessionId, sessionLimit);
	}

	@Override
	public User checkUserWithSessionKey(String cookieValue) {
		return dao.checkUserWithSessionKey(cookieValue);
	}

	
}