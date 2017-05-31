package com.object.asc.project.domain;

public class projectRelease {
	private int projectReleaseNo;
	private int projectListNo;

	public projectRelease() { }

	public projectRelease(int projectReleaseNo, int projectListNo) {
		this.projectReleaseNo = projectReleaseNo;
		this.projectListNo = projectListNo;
	}

	public int getProjectReleaseNo() {
		return projectReleaseNo;
	}

	public void setProjectReleaseNo(int projectReleaseNo) {
		this.projectReleaseNo = projectReleaseNo;
	}

	public int getProjectListNo() {
		return projectListNo;
	}

	public void setProjectListNo(int projectListNo) {
		this.projectListNo = projectListNo;
	}

	@Override
	public String toString() {
		return "projectRelease [projectReleaseNo=" + projectReleaseNo + ", projectListNo=" + projectListNo + "]";
	}

}
