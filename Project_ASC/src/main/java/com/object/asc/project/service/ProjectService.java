package com.object.asc.project.service;

import java.util.List;

import com.object.asc.lobby.domain.ProjectList;

public interface ProjectService {
	
	/** 프로젝트 날짜 받아오기 */
	public List<ProjectList> projectDate (int projectListNo);
}
