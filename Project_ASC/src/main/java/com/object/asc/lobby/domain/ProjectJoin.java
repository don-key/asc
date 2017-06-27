package com.object.asc.lobby.domain;

/**
 *
 * 참여 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.lobby.domain
 * @파일명 : ProjectJoin.java
 * @작성자 : 김동현
 * @작성일 : 2017. 6. 01.
 *
 */
public class ProjectJoin {
	private int projectJoinNo;

	public ProjectJoin() {	}

	public ProjectJoin(int projectJoinNo) {
		this.projectJoinNo = projectJoinNo;
	}

	public int getProjectJoinNo() {
		return projectJoinNo;
	}

	public void setProjectJoinNo(int projectJoinNo) {
		this.projectJoinNo = projectJoinNo;
	}

	@Override
	public String toString() {
		return "ProjectJoin [projectJoinNo=" + projectJoinNo + "]";
	}

}
