package com.object.asc.lobby.service;

import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.ProjectRelease;

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
	
	/** 1-4. 대쉬보드 생성(회원 전부) */
	public void dashBoardRegister(DashBoard dashBoard);
	/** 1-5. 릴리즈 생성 */
	public void projectRelease(ProjectRelease projectRelease);
	/** 1-6. 자료실 생성 */
	public void libraryRegister();
	/** 1-7. 간트차트 생성 */
	public void ganttChartRegister();
	/** 1-8. 계획 실행 차트 생성*/
	public void actionChartRegister();
    /** 1-9. 스크럼 생성 */
	public void scrumRegister();
	/** 1-10. 스프린트 생성*/
	public void sprintRegister();
	
	/** 프로젝트 날짜 받아오기 */
	public ProjectList projectDate (int projectListNo);
}
