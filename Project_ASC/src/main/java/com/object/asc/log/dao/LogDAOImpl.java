package com.object.asc.log.dao;

import java.util.List;

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

	@Override
	public List<String> logListAll(Log log) {
		return sqlSession.selectList(namespace + ".listAll", log);
	}

	
}
