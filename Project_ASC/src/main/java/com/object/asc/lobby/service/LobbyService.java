package com.object.asc.lobby.service;

import java.util.List;

import com.object.asc.lobby.domain.ProjectList;

public interface LobbyService {
	/** 프로젝트 내역 등록 */
	public void register(ProjectList projectList);
	
	/** 프로젝트 날짜 받아오기 */
	public ProjectList projectDate (int projectListNo);
}
