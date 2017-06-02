package com.object.asc.user.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.user.domain.User;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.object.asc.mapper.UserMapper";

	@Override
	public void register(User user) {
		sqlSession.insert(namespace + ".register", user);
	}

	@Override
	public void modify(User user) {
		sqlSession.update(namespace + ".modify", user);
	}

	@Override
	public User login(User user) {
		
		return sqlSession.selectOne(namespace + ".login", user);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date sessionLimit) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("sessionLimit", sessionLimit);
		
		sqlSession.update(namespace + ".keepLogin", paramMap);
	}

	@Override
	public User checkUserWithSessionKey(String cookieValue) {
		return sqlSession.selectOne(namespace + ".checkUserWithSessionKey", cookieValue);
	}

	@Override
	public List<String> userFind(String id) {
		return sqlSession.selectList(namespace + ".userFind", id);
	}

	@Override
	public int userIdFind(String id) {
		return sqlSession.selectOne(namespace + ".userIdFind", id);
	}
	

}
