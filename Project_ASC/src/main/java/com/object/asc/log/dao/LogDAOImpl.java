package com.object.asc.log.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.log.domain.Log;

@Repository
public class LogDAOImpl implements LogDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.object.asc.mapper.LogMapper";

	@Override
	public void writeLog(Log log) {
		sqlSession.insert(namespace + ".writeLog",log);
		
	}

	
}