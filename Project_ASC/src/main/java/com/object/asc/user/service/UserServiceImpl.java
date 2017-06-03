package com.object.asc.user.service;

import java.sql.Date;
import java.util.List;

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

	@Override
	public User get(int userNo) {
		return dao.get(userNo);
	}

	@Override
	public void delete(User user) {
		dao.delete(user);
		
	}

	@Override
	public List<String> userFind(String id) {
		return dao.userFind(id+"%");
	}

	@Override
	public int userIdFind(String id) {
		return dao.userIdFind(id);
	}

	@Override
	public String findId(String name, String phone) {
		return dao.findId(name, phone);
	}

	@Override
	public String findPw(String id, String name, String phone) {
		return dao.findPw(id, name, phone);
	}

	
}