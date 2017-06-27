package com.object.asc.lobby.domain;

/**
 *
 * 참여 내역 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.lobby.domain
 * @파일명 : ProjectJoinList.java
 * @작성자 : 김동현
 * @작성일 : 2017. 6. 01.
 *
 */
public class ProjectJoinList {
	private int projectJoinListNo;
	private int projectJoinNo;
	private int userNo;
	private int status;

	public ProjectJoinList() {	}

	public ProjectJoinList(int projectJoinListNo, int projectJoinNo, int userNo, int status) {
		this.projectJoinListNo = projectJoinListNo;
		this.projectJoinNo = projectJoinNo;
		this.userNo = userNo;
		this.status = status;
	}

	public int getProjectJoinListNo() {
		return projectJoinListNo;
	}

	public void setProjectJoinListNo(int projectJoinListNo) {
		this.projectJoinListNo = projectJoinListNo;
	}

	public int getProjectJoinNo() {
		return projectJoinNo;
	}

	public void setProjectJoinNo(int projectJoinNo) {
		this.projectJoinNo = projectJoinNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ProjectJoinList [projectJoinListNo=" + projectJoinListNo + ", projectJoinNo=" + projectJoinNo
				+ ", userNo=" + userNo + ", status=" + status + "]";
	}

}
