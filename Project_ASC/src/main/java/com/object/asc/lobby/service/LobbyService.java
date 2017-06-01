package com.object.asc.lobby.service;

import org.springframework.web.multipart.MultipartFile;

import com.object.asc.lobby.domain.ProjectJoin;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;

public interface LobbyService {
	
	/** 프로젝트 생성 */
	public void projectRegister(ProjectList projectList, MultipartFile file);
	
	/** 기능 */
	
	/** 프로젝트 날짜 받아오기 */
	public ProjectList projectDate (int projectListNo);
}
