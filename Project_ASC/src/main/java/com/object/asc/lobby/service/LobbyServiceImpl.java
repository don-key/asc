package com.object.asc.lobby.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.lobby.dao.LobbyDAO;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;

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
	public ProjectList projectDate(int projectListNo) {
		return dao.projectDate(projectListNo);
	}






}
