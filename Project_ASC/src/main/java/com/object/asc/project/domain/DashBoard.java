package com.object.asc.project.domain;

public class DashBoard {

	private int dashBoardNo;
	private int projectListNo;
	private int userNo;
	private String memo;

	public DashBoard() {
	}

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
