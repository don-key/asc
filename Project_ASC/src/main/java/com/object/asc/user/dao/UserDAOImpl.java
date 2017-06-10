package com.object.asc.user.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.object.asc.user.domain.User;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.object.asc.mapper.UserMapper";
	
	Logger logger = Logger.getLogger(UserDAOImpl.class);
	
	@Override
	public void register(User user) {
		
		sqlSession.insert(namespace + ".register", user);
	}

	@Override
	public boolean idCheck(String id) {
		String idCheck = sqlSession.selectOne(namespace + ".idCheck", id);
		if (idCheck == null) {
			return true;
		} else{
			return false;
		}
	}

	@Override
	public User get(int userNo) {
		
		return sqlSession.selectOne(namespace + ".get", userNo);
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
	public void delete(int userNo) {
		sqlSession.update(namespace + ".delete", userNo);
	}


	@Override
	public List<String> userFind(String id) {
		return sqlSession.selectList(namespace + ".userFind", id);
	}

	@Override
	public int userIdFind(String id) {
		return sqlSession.selectOne(namespace + ".userIdFind", id);
	}

	@Override
	public String findId(String name, String phone) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("name", name);
		paramMap.put("phone", phone);
		return sqlSession.selectOne(namespace + ".findId", paramMap);
	}

	@Override
	public String findPw(String id, String name, String phone) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("name", name);
		paramMap.put("phone", phone);
		return sqlSession.selectOne(namespace + ".findPw", paramMap);
	}

	@Override
	public void createNewPw(String id, String password) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("password", password);
		sqlSession.update(namespace + ".createNewPw", paramMap);
	}

	

}
