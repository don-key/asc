package com.object.asc.lobby.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.object.asc.lobby.domain.ProjectJoin;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.domain.DashBoard;

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
	
	/** 프로젝트 리스트 전체 조회*/
	public List<ProjectList> projectListAll(int userNo);
	
	/** 프로젝트 리스트 조회 */
	public ProjectList getProjectList(int projectListNo);
	/** 프로젝트 날짜 받아오기 */
	public ProjectList projectDate (int projectListNo);
	
	/** 프로젝트 인원수 조회*/
	public int memberCount(int projectJoinNo);
	
	/** 프로젝트 참여 멤버 이름 조회 */
	public List<String> memberName (int projectListNo); 
	
	/** 프로젝트 참여 멤버 아이디/구성원 조회*/
	public List<Map<String, Object>> memberId(int projectListNo);
	
	/** 프로젝트 수정*/
	public void projectListUpdate(ProjectList projectList);
	
	/** 참여 내역 삭제*/
	public void projectJoinListDelete(ProjectJoinList projectJoinList);
	
	/** 프로젝트 내역 삭제 */
	public void projectListDelete(int projectListNo);
	
	/** 대쉬보드 삭제 플젝으로 옮겨야지.....*/
	public void dashBoardDelete(DashBoard dashBoard);
	
	
}
