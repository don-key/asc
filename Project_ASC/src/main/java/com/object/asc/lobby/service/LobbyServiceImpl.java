package com.object.asc.lobby.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.lobby.dao.LobbyDAO;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.ProjectRelease;

@Service
public class LobbyServiceImpl implements LobbyService {
	
	@Inject
	private LobbyDAO dao;
	
	
	@Override
	public void projectJoinRegister() {
		dao.projectJoinRegister();
	}
	
	@Override
	public void projectListRegister(ProjectList projectList) {
		dao.projectListRegister(projectList);
	}
	
	@Override
	public void projectJoinListRegister(ProjectJoinList projectJoinList) {
		dao.projectJoinListRegister(projectJoinList);
	}
	
	@Override
	public void dashBoardRegister(DashBoard dashBoard) {
		
	}

	@Override
	public void projectRelease(ProjectRelease projectRelease) {
		
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
	
	@Override
	public ProjectList projectDate(int projectListNo) {
		return dao.projectDate(projectListNo);
	}

	






}
