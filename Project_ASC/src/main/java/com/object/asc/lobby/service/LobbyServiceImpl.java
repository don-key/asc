package com.object.asc.lobby.service;

import javax.inject.Inject;

import com.object.asc.lobby.dao.LobbyDAO;
import com.object.asc.lobby.domain.ProjectList;

public class LobbyServiceImpl implements LobbyService {
	
	@Inject
	private LobbyDAO dao;
	
	@Override
	public void register(ProjectList projectList) {
		dao.register(projectList);
	}


}
