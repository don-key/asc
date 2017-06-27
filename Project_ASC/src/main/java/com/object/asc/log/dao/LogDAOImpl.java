package com.object.asc.log.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.log.domain.Log;

/**
 * 
 * LogDao 인터페이스를 구현하는 클래스
 * 
 * @패키지 : com.object.asc.log.dao
 * @파일명 : LogDAOImpl.java
 * @작성자 : 최신영
 * @작성일 : 2017. 6. 01.
 *
 */
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
	public List<String> logListAll(int projectListNo, int userNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("projectListNo", projectListNo);
		map.put("userNo", userNo);
		return sqlSession.selectList(namespace + ".listAll", map);
	}

	
}
