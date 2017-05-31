package com.object.asc.lobby.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.lobby.domain.ProjectList;
@Repository
public class LobbyDAOImpl implements LobbyDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.object.asc.mapper.LobbyMapper";
	
	
	@Override
	public void register(ProjectList projectList) {
		sqlSession.insert(namespace+".register", projectList);
	}

}
