package com.object.asc.project.dao;

import java.util.List;
import com.object.asc.lobby.domain.ProjectList;

public interface ProjectDAO {
	
	/** 프로젝트 날짜 받아오기 */
	public List<ProjectList> projectDate (int projectListNo);
	
}
