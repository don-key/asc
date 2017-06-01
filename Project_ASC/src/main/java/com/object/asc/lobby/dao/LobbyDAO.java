package com.object.asc.lobby.dao;

import org.eclipse.core.internal.resources.Project;

import com.object.asc.lobby.domain.ProjectJoin;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;

public interface LobbyDAO {
	
	/** 프로젝트 생성 시 */
	
	/** 1-1. 참여 생성 */
	public void projectJoinRegister();
	
	/** 1-2. 프로젝트 내역 생성 */
	public void projectListRegister(ProjectList projectList);
	
	/** 1-3. 참여 내역 생성 (초대) 
	 * status : 1 -> 스크럼마스터
	 * status : 0 -> 팀원
	 * */
	public void projectJoinListRegister(ProjectJoinList projectJoinList);
	
	/** 기능 */
	
	/** 참여 번호 조회*/
	public ProjectJoin getProjectJoinNo();
	
	/** 프로젝트 날짜 받아오기 */
	public ProjectList projectDate (int projectListNo);
}
