package com.object.asc.lobby.domain;

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
