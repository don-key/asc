package com.object.asc.lobby.dao;

import com.object.asc.lobby.domain.ProjectList;

public interface LobbyDAO {
	
	/** 프로젝트 내역 등록 */
	public void register(ProjectList projectList);
}
