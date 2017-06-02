package com.object.asc.lobby.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.gantt.domain.ActionChart;
import com.object.asc.gantt.domain.GanttChart;
import com.object.asc.lobby.domain.ProjectJoin;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.Library;
import com.object.asc.project.domain.ProjectRelease;
import com.object.asc.project.domain.Scrum;
import com.object.asc.project.domain.Sprint;
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
	public ProjectJoin getProjectJoinNo() {
		return sqlSession.selectOne(namespace+".projectJoinNo");
	}

	@Override
	public List<ProjectList> projectListAll() {
		return sqlSession.selectList(namespace+".projectListAll");
	}

}
