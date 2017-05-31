package com.object.asc.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.lobby.domain.ProjectList;

@Repository
public class ProjectDAOImpl implements ProjectDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.object.asc.mapper.ProjectMapper";

	@Override
	public List<ProjectList> projectDate(int projectListNo) {
		return sqlSession.selectList(namespace+".projectDate", projectListNo);
	}

	
	

}
