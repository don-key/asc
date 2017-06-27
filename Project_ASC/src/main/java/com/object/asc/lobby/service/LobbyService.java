package com.object.asc.lobby.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.object.asc.lobby.domain.ProjectJoin;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;

/**
 * 
 * 로비 관련 인터페이스 정의
 * 
 * @패키지 : com.object.asc.lobby.service
 * @파일명 : LobbyService.java
 * @작성자 : 김동현
 * @작성일 : 2017. 6. 01. 
 *
 */
public interface LobbyService {
	
	/** 프로젝트 생성 */
	public void projectRegister(ProjectList projectList, MultipartFile file, String[] invitationList);
	
	/** 기능 */
	
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
	
	/** 프로젝트 참여 멤버 아이디/구성원 조회 */
	public List<Map<String, Object>> memberId(int projectListNo);
	
	/** 프로젝트 수정 */
	public void projectUpdate(ProjectList projectList, MultipartFile file, String[] invitationList);
	
	/** 프로젝트 내역 삭제 */
	public void projectListDelete(int projectListNo);
}
