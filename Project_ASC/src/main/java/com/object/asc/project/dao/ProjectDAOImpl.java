package com.object.asc.project.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.object.asc.lobby.domain.ProjectList;

public class ProjectDAOImpl implements ProjectDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.object.asc.mapper.ProjectMapper";
	
	

}
