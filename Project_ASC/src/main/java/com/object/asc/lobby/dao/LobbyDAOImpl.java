package com.object.asc.lobby.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.lobby.domain.ProjectJoin;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;
@Repository
public class LobbyDAOImpl implements LobbyDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.object.asc.mapper.LobbyMapper";
	
	@Override
	public void projectJoinRegister() {
		sqlSession.insert(namespace+".projectJoinRegister");
	}
	
	@Override
	public void projectListRegister(ProjectList projectList) {
		sqlSession.insert(namespace+".projectListRegister", projectList);
	}
	
	@Override
	public ProjectList projectDate(int projectListNo) {
		return sqlSession.selectOne(namespace+".projectDate", projectListNo);
	}

	@Override
	public void projectJoinListRegister(ProjectJoinList projectJoinList) {
		sqlSession.insert(namespace+".projectJoinListRegister",projectJoinList);
	}

	@Override
	public void dashBoardRegister() {
	}

	@Override
	public void projectRelease() {
	}

	@Override
	public void libraryRegister() {
	}

	@Override
	public void ganttChartRegister() {
	}

	@Override
	public void actionChartRegister() {
	}

	@Override
	public void scrumRegister() {
	}

	@Override
	public void sprintRegister() {
	}

	


}
