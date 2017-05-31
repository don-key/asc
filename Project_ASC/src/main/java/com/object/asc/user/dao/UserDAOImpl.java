<<<<<<< HEAD
package com.object.asc.user.dao;

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
		sqlSession.insert(namespace+".register", user);
	}

	@Override
	public void modify(User user) {
		sqlSession.update(namespace+".modify", user);
	}
	
	

}
=======
package com.object.asc.user.dao;

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
		sqlSession.insert(namespace+".register", user);
	}

	@Override
	public void modify(User user) {
		sqlSession.update(namespace+".modify", user);
	}
	
	

}
>>>>>>> branch 'master' of https://github.com/don-key/asc.git
