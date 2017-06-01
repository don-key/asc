package com.object.asc.lobby.service;

import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;

public interface LobbyService {
	
	/** 프로젝트 생성 시*/
	/** 1-1. 참여 생성 */
	public void projectJoinRegister();
	
	/** 1-2. 프로젝트 내역 생성 */
	public void projectListRegister(ProjectList projectList);
	
	/** 1-3. 참여 내역 생성 (초대) 
	 * status : 1 -> 스크럼마스터
	 * status : 0 -> 팀원
	 * */
	public void projectJoinListRegister(ProjectJoinList projectJoinList);
	
	/** 프로젝트 생성 */
	public void projectRegister();
	
	/** 프로젝트 날짜 받아오기 */
	public ProjectList projectDate (int projectListNo);
}
