package com.object.asc.lobby.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.gantt.domain.ActionChart;
import com.object.asc.gantt.domain.GanttChart;
import com.object.asc.lobby.dao.LobbyDAO;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.dao.ProjectDAO;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.Library;
import com.object.asc.project.domain.ProjectRelease;
import com.object.asc.project.domain.Scrum;
import com.object.asc.project.domain.Sprint;

@Service
public class LobbyServiceImpl implements LobbyService {
	
	@Inject
	private LobbyDAO lobbyDao;
	
	@Inject
	private ProjectDAO projectDao;
	
	@Override
	public void projectJoinRegister() {
		lobbyDao.projectJoinRegister();
	}
	
	@Override
	public void projectListRegister(ProjectList projectList) {
		lobbyDao.projectListRegister(projectList);
	}
	
	@Override
	public void projectJoinListRegister(ProjectJoinList projectJoinList) {
		lobbyDao.projectJoinListRegister(projectJoinList);
	}
	
	@Override
	public void projectRegister() {
		
	}
	
	@Override
	public ProjectList projectDate(int projectListNo) {
		return lobbyDao.projectDate(projectListNo);
	}

}
