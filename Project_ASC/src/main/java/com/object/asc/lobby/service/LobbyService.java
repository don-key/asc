package com.object.asc.lobby.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.object.asc.lobby.domain.ProjectJoin;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;

public interface LobbyService {
	
	/** 프로젝트 생성 */
	public void projectRegister(ProjectList projectList, MultipartFile file, String[] invitationList);
	
	/** 기능 */
	
	/** 프로젝트 리스트 조회*/
	public List<ProjectList> projectListAll();
	
	/** 프로젝트 날짜 받아오기 */
	public ProjectList projectDate (int projectListNo);
	
	/** 프로젝트 인원수 조회*/
	public int memberCount(int projectJoinNo);
	
	/** 프로젝트 참여 멤버 이름 조회 */
	public List<String> memberName (int projectJoinNo);
}
