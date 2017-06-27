package com.object.asc.project.domain;
/**
 * 
 * 대시보드 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.project.domain
 * @파일명 : DashBoard.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01. 
 *
 */
public class DashBoard {

	private int dashBoardNo;
	private int projectListNo;
	private int userNo;
	private String memo;

	public DashBoard() {}

	public DashBoard(int dashBoardNo, int projectListNo, int userNo, String memo) {
		this.dashBoardNo = dashBoardNo;
		this.projectListNo = projectListNo;
		this.userNo = userNo;
		this.memo = memo;
	}

	public int getDashBoardNo() {
		return dashBoardNo;
	}

	public void setDashBoardNo(int dashBoardNo) {
		this.dashBoardNo = dashBoardNo;
	}

	public int getProjectListNo() {
		return projectListNo;
	}

	public void setProjectListNo(int projectListNo) {
		this.projectListNo = projectListNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "DashBoard [dashBoardNo=" + dashBoardNo + ", projectListNo=" + projectListNo + ", userNo=" + userNo
				+ ", memo=" + memo + "]";
	}

}
