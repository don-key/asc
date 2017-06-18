package com.object.asc.gantt.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BurnDownDaoImpl implements BurnDownDao {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.object.asc.mapper.BurnMapper";
	
	@Override
	public List<HashMap<String, Object>> getSprintNo(int projectListNo) {
		return sqlSession.selectList(namespace+".getSprintNo", projectListNo);
	}

	@Override
	public List<HashMap<String, Object>> getSprintBackLog(int projectListNo) {
		return sqlSession.selectList(namespace+".getSprintBackLog", projectListNo);
	}

	@Override
	public int backLogCount(int sprintNo) {
		return sqlSession.selectOne(namespace + ".backLogCount", sprintNo);
	}

	@Override
	public List<String> doneDate(int sprintNo) {
		return sqlSession.selectList(namespace+".doneDate", sprintNo);
	}

}
