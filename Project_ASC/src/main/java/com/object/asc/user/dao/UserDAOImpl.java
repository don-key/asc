package com.object.asc.user.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.user.domain.User;

@Repository


public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.object.obeject.mapper.UserMapper";

	@Override
	public void register(User user) {
		sqlSession.insert(namespace+".register", user);
	}
	
	

}
