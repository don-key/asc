package com.object.asc.lobby.domain;

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
